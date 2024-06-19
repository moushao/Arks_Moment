import CommonConstant from '../constant/CommonConstant';
import { momentStateMapper } from '../mapper/StateMapper';
import { MomentModel } from '../model/MomentModel';
import MomentRepository from '../repository/MomentRepository';
import { MomentState } from './uistate/MomentState';
import { UserState } from './uistate/UserState';

class MomentViewModel {
  private originData: MomentState[] = []
  userCallBack: Promise<UserState>
  momentsStateCallBack: (momentModel: MomentModel[]) => void
  private pageIndex = 0

  public getUser(): Promise<UserState> {
    return new Promise((resolve: Function) => {
      MomentRepository.getUser().then((user: UserState) => {
        let userState = new UserState(user.profileImage, user.avatar, user.nick, user.username)
        resolve(userState)
      }).catch(message => {
        console.log("getUser error when map ui state : " + message)
      })
    })
  }

  public getMomentList(isRefresh: boolean): Promise<MomentState[]> {
    console.log("getMomentList isRefresh: "+isRefresh)
    return new Promise(async (resolve: Function) => {
      if (isRefresh) {
        this.originData = []
        this.pageIndex = 0
        MomentRepository.getMomentList().then((momentModels: MomentModel[]) => {
          const momentState = momentModels.map(item => {
            return momentStateMapper(item)
          })
          this.originData = momentState
          this.pageIndex++
          resolve(this.originData.slice(0, this.pageIndex * CommonConstant.PAGE_SIZE))
        }).catch(message => {
          console.log("getMomentList error when map ui state: " + message)
        })
      } else {
        setTimeout(() => {
          this.pageIndex++
          const slice = this.originData.slice(0, this.pageIndex * CommonConstant.PAGE_SIZE)
          console.log("getMomentList slice size:"+ slice.length)
          resolve(slice)
        }, 3000)
      }
    })
  }
}

async function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default new MomentViewModel()