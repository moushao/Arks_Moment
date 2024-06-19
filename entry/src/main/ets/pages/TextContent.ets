import CommonConstant from '../constant/CommonConstant'

@Component
export default struct TextContent {
  @Prop content: string
  name: string
  @State isShowMore: boolean = false
  @State isExpand: boolean = false

  aboutToAppear() {
    this.isShowMore = this.content !== undefined && this.content.length > 50
    this.isExpand = this.isShowMore.valueOf()
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(this.name)
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
          .width(CommonConstant.FULL)
          .alignSelf(ItemAlign.Start)
        if (this.content !== undefined && this.content !== null && this.content.length > 0) {
          Text(this.content)
            .fontColor(Color.Black)
            .fontSize(17)
            .alignSelf(ItemAlign.Start)
            .width(CommonConstant.FULL)
            .maxLines(this.isExpand ? 3 : -1)
            .textOverflow({ overflow: this.isExpand ? TextOverflow.Ellipsis : TextOverflow.None })
          if (this.isShowMore) {
            Text(this.isExpand ? "Show More" : "Close")
              .fontSize(17)
              .fontColor(Color.Blue)
              .alignSelf(ItemAlign.Start)
              .onClick(event => {
                this.isExpand = !this.isExpand
              })
          }
        }
      }
    }
  }
}

@Component
@Preview
struct TextContentPreview {
  @State content: string = "粘性标题是一种常见的标题模式，常用于定位字母列表的头部元素。如下图所示，在联系人列表中滚动A部分时，B部分开始的头部元素始终处于A的下方。而在开始滚动B部分时，B的头部会固定在屏幕顶部，直到所有B的项均完成滚动后，才被后面的头部替代。粘性标题不仅有助于阐明列表中数据的表示形式和用途，还可以帮助用户在大量信息中进行数据定位，从而避免用户在标题所在的表的顶部与感兴趣区域之间反复滚动。"

  build() {
    TextContent({ content: this.content, name: "咪咪" })
  }
}