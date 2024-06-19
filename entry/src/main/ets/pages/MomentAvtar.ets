import CommonConstant from '../constant/CommonConstant'
import TextContent from './TextContent'

@Component
export default struct MomentAvtar {
  avtar: string = ""

  build() {
    Image(this.avtar)
      .width(60)
      .height(60)
      .margin({ left: 10 })
      .borderRadius(12)
      .alignSelf(ItemAlign.Start)
  }
}