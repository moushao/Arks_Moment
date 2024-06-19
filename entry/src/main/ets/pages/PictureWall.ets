import CommonConstant from '../constant/CommonConstant'
import { columnsTemplate, pictureWallHeight, rowsTemplate } from '../utils/PictureTemplateUtils'
import { ImageState } from '../viewmodel/uistate/MomentState'

@Component
export default struct PictureWall {
  pictures: ImageState[] = null

  build() {
    Grid() {
      ForEach(this.pictures, (item: ImageState) => {
        GridItem() {
          Image(item.url).objectFit(ImageFit.Cover)
        }
      },
        (item: ImageState, index?: number) => JSON.stringify(index)
      )
    }
    .columnsGap(3)
    .rowsGap(3)
    .rowsTemplate(rowsTemplate(this.pictures.length))
    .columnsTemplate(columnsTemplate(this.pictures.length))
    .width(this.pictures.length > 1 ? CommonConstant.FULL : 136)
    .height(pictureWallHeight(this.pictures.length))
    .alignSelf(ItemAlign.Start)
  }
}

@Builder function loadPicture(url: string) {
  Image(url)
}

@Component
@Preview
struct PictureWallOnePreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES.slice(1, 1) })
  }
}

@Component
@Preview
struct PictureWallTwoPreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES.slice(3, 5) })
  }
}

@Component
@Preview
struct PictureWallFourPreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES.slice(4, 8) })
  }
}

@Component
@Preview
struct PictureWallSixPreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES.slice(2, 8) })
  }
}

@Component
@Preview
struct PictureWallSevenPreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES.slice(1, 8) })
  }
}

@Component
@Preview
struct PictureWallPreview {
  build() {
    PictureWall({ pictures: CommonConstant.PICTURES })
  }
}

