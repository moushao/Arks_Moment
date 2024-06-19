import CommonConstant from '../constant/CommonConstant'
import { UserState } from '../viewmodel/uistate/UserState'

@Component
export default struct UserProfileWall {
  @Link userState: UserState

  aboutToAppear(){
    console.log("aboutToAppear UserState:"+JSON.stringify(this.userState))
  }
  build() {
    RelativeContainer() {
      Image(this.userState.profileImage)
        .width(CommonConstant.FULL)
        .height(300)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .id("profileImage")

      Image(this.userState.avatar)
        .width(90)
        .height(90)
        .borderRadius(12)
        .offset({ x: -20, y: 30 })
        .alignRules({
          bottom: { anchor: 'profileImage', align: VerticalAlign.Bottom },
          right: { anchor: 'profileImage', align: HorizontalAlign.End }
        })
        .id("avtar")

      Text(this.userState.nick)
        .alignSelf(ItemAlign.End)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .fontSize(18)
        .alignRules({
          top: { anchor: 'avtar', align: VerticalAlign.Top },
          right: { anchor: 'avtar', align: HorizontalAlign.Start }
        })
        .offset({ x: -30, y: 60 })
        .id("name")
    }.width(CommonConstant.FULL)
    .height(350)
  }
}

@Preview
@Component
struct PhotoWallPreview {
  @State shit: UserState =  new UserState(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb86QpwmLh0bjm0MkplOgtx2OWix6nKQWP5A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR55OFzZiUA4BRm0siI0XQb4oYQJniVkjEmbw&s",
    "滴滴答答",
    "滴答"
  )

  build() {
    UserProfileWall({ userState: $shit })
  }
}