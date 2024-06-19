import { CommentState, ImageState, MomentState } from '../viewmodel/uistate/MomentState'
import { UserState } from '../viewmodel/uistate/UserState'

export const enum ContentType {
  JSON = 'application/json'
}

export default class CommonConstant {
  static readonly RefreshConstant_DELAY_PULL_DOWN_REFRESH: number = 50
  static readonly RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME: number = 150
  static readonly RefreshConstant_DELAY_SHRINK_ANIMATION_TIME: number = 500
  static readonly DELAY_ANIMATION_DURATION: number = 300
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70
  static readonly PAGE_SIZE: number = 5
  static readonly DELAY_TIME: number = 1000
  static readonly ANIMATION_DURATION: number = 2000
  static readonly HTTP_READ_TIMEOUT: number = 10000
  static readonly FULL: string = '100%'
  static readonly HTTP_CODE_200: number = 200
  static readonly SERVER_CODE_SUCCESS: string = 'success'
  static readonly CONTENT: string = "近日，广东佛山。顾客与餐饮商家之间的“羁绊”，可能比我们想象的还要深。某餐饮观察账号数据显示，一名男子自2019至2024年，连续在同一家粤菜馆点外卖达到2101次，相当于连续5年每天都在同一家店下单。网友纷纷评论调侃：这是吃成股东了吧。对此，该商家回应，看到这个数据的时候很惊讶也很感动，遇到懂吃的用户，就像高山流水遇知音。你最多吃过同一家餐厅多少次呢？是因为什么原因"
  static readonly PICTURES: ImageState[] = [
    new ImageState('data:image/jpeg;base64,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'),
    new ImageState('https://img1.baidu.com/it/u=345741888,1354788666&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067'),
    new ImageState('https://img0.baidu.com/it/u=2865981107,73326865&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'),
    new ImageState('data:image/jpeg;base64,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'),
    new ImageState('data:image/jpeg;base64,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'),
    new ImageState('https://img2.baidu.com/it/u=1147292458,3402575330&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'),
    new ImageState('https://img0.baidu.com/it/u=3108954904,3938895794&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800'),
    new ImageState('https://img0.baidu.com/it/u=2729251081,2252765089&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=889'),
    new ImageState('https://img1.baidu.com/it/u=2027976683,420603971&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1424')
  ]
  static readonly USER_STATE: UserState = new UserState(
    CommonConstant.PICTURES[2].url,
    CommonConstant.PICTURES[3].url,
    "滴滴答答",
    "滴答"
  )
  static readonly MOMENTS: MomentState[] =
    [
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 2),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪1",
          "滴答"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "咪咪2",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(2, 4),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪3",
          "滴答2"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(3, 6),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪4",
          "滴答3"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 8),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪5",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES,
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪55",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 2),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪7",
          "滴答"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(2, 4),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪8",
          "滴答2"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(3, 6),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪9",
          "滴答3"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 8),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪10",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES,
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪11",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ), new MomentState(
      CommonConstant.CONTENT,
      CommonConstant.PICTURES.slice(1, 2),
      new UserState(
        CommonConstant.PICTURES[2].url,
        CommonConstant.PICTURES[3].url,
        "咪咪12",
        "滴答"
      ),
      [
        new CommentState(
          "content",
          new UserState(
            CommonConstant.PICTURES[2].url,
            CommonConstant.PICTURES[3].url,
            "滴答答",
            "滴答"
          )
        )]
    ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(2, 4),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪13",
          "滴答2"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(3, 6),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪14",
          "滴答3"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 8),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪15",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES,
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪16",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 2),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪17",
          "滴答"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(2, 4),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪18",
          "滴答2"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(3, 6),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪19",
          "滴答3"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 8),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪20",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES,
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪21",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 2),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪22",
          "滴答"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(2, 4),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪23",
          "滴答2"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(3, 6),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪24",
          "滴答3"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES.slice(1, 8),
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪25",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      ),
      new MomentState(
        CommonConstant.CONTENT,
        CommonConstant.PICTURES,
        new UserState(
          CommonConstant.PICTURES[2].url,
          CommonConstant.PICTURES[3].url,
          "咪咪26",
          "滴答4"
        ),
        [
          new CommentState(
            "content",
            new UserState(
              CommonConstant.PICTURES[2].url,
              CommonConstant.PICTURES[3].url,
              "滴滴答答",
              "滴答"
            )
          )]
      )
    ]
}


