import CommonConstant from '../constant/CommonConstant'
import { MomentState } from '../viewmodel/uistate/MomentState'
import Comments from './Comments'
import MomentAvtar from './MomentAvtar'
import PictureWall from './PictureWall'
import TextContent from './TextContent'

@Component
export default struct MomentItem {
  @State momentsState: MomentState = null

  aboutToAppear() {
  }

  build() {
    Row() {
      MomentAvtar({ avtar: this.momentsState.sender.avatar })
      Column({ space: 5 }) {
        TextContent({ content: this.momentsState.content, name: this.momentsState.sender.nick })
        if (this.momentsState.images !== undefined && this.momentsState.images !== null && this.momentsState.images.length > 0) {
          PictureWall({ pictures: this.momentsState.images })
        }
        if (this.momentsState.comments !== undefined && this.momentsState.comments !== null && this.momentsState.comments.length > 0) {
          Comments({ comments: this.momentsState.comments })
        }
      }
      .layoutWeight(1)
      .padding({ left: 10, right: 5 })
    }
    .width(CommonConstant.FULL)
    .padding({ top: 5 })
  }
}

@Component
@Preview
struct MomentItemPreview {
  build() {

  }
}