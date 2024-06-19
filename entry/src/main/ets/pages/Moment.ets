import CommonConstant from '../constant/CommonConstant'
import { listTouchEvent } from '../utils/PullDownRefresh'
import MomentViewModel from '../viewmodel/MomentViewModel'
import PullLoadModel from '../viewmodel/PullLoadModel'
import { MomentState } from '../viewmodel/uistate/MomentState'
import { PageState } from '../viewmodel/uistate/PageState'
import { UserState } from '../viewmodel/uistate/UserState'
import MomentItem from './MomentItem'
import UserProfileWall from './UserProfileWall'

@Entry
@Component
struct Moment {
  @State userState?: UserState = new UserState(null, null, null, null)
  @State momentsState: MomentState[] = []
  @State pullLoadModel: PullLoadModel = new PullLoadModel()

  private obtainUserProfile() {
    MomentViewModel.getUser().then((userState: UserState) => {
      this.pullLoadModel.pageState = PageState.Success
      console.log(`get userState success:${JSON.stringify(userState)}`)
      this.userState = userState
    })
  }

  private obtainMomentList(isRefresh: boolean) {
    MomentViewModel.getMomentList(isRefresh).then((momentsState: MomentState[]) => {
      console.log(`getMomentList success:${momentsState.length}`)
      this.momentsState = momentsState
      this.pullLoadModel.pageState = PageState.Success
      if (this.momentsState.length === this.pullLoadModel.pageSize) {
        this.pullLoadModel.currentPage++;
        this.pullLoadModel.hasMore = true;
      } else {
        this.pullLoadModel.hasMore = false;
      }
      this.pullLoadModel.newsData = this.momentsState
    }).finally(() => {
      this.pullLoadModel.isVisiblePullUpLoad = false
    })
  }

  private refresh() {
    console.log("touchUpPullRefresh")
    this.userState = new UserState(null, "", "", "")
    this.momentsState = []
    this.obtainUserProfile()
    this.obtainMomentList(true)
  }

  aboutToAppear() {
    this.refresh()
  }

  build() {
    Column() {
      List({ space: 15 }) {
        if (this.userState.isValid()) {
          ListItem() {
            UserProfileWall({ userState: $userState })
          }
        }

        ForEach(this.momentsState,
          (item: MomentState) => {
            ListItem() {
              MomentItem({ momentsState: item })
            }
          },
          (item, index) => JSON.stringify(item) + index
        )

        if (this.pullLoadModel.isVisiblePullUpLoad) {
          ListItem() {
            Text("正在加载更多")
          }.width(CommonConstant.FULL)
          .alignSelf(ItemAlign.Center)
        }
      }
      .width(CommonConstant.FULL)
      .layoutWeight(1)
      .onScrollIndex((start: number, end: number) => {
        this.pullLoadModel.startIndex = start;
        this.pullLoadModel.endIndex = end;
      })
      .onTouch((event: TouchEvent | undefined) => {
        if (event) {
          if (this.pullLoadModel.pageState === PageState.Success) {
            listTouchEvent(
              this.pullLoadModel, event,
              () => {
                this.momentsState = []
                this.pullLoadModel.pageState = PageState.Loading
                this.refresh()
              },
              () => {
                console.log("touchUpLoadMore")
                this.obtainMomentList(false)
              });
          }
        }
      })
    }
  }
}