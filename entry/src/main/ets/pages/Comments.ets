import { CommentState } from '../viewmodel/uistate/MomentState'
import { UserState } from '../viewmodel/uistate/UserState'

@Component
export default struct Comments {
  comments: CommentState[]

  build() {
    List() {
      ForEach(this.comments, (item: CommentState) => {
        ListItem() {
          Row({ space: 5 }) {
            Text(item.sender.username + " :")
              .fontColor(Color.Blue)
              .fontWeight(FontWeight.Bold)
              .fontSize(18)
              .alignSelf(ItemAlign.Start)

            Text(item.content)
              .fontColor(Color.Black)
              .fontSize(17)
              .alignSelf(ItemAlign.Start)
              .layoutWeight(1)
          }
        }
      },
        (item: CommentState) => JSON.stringify(item)
      )
    }
  }
}

@Component
@Preview
struct CommentsPreview {
  @State comments: CommentState[] = [
    new CommentState("粘性标题是一种常见的标题模式", new UserState("", "", "壮壮", "小乔")),
    new CommentState("坚决不抽常量", new UserState("", "", "壮壮", "大乔"))
  ]

  build() {
    Comments({ comments: this.comments })
  }
}

