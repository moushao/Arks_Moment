import { MomentModel, ImageModel, Comment } from '../model/MomentModel';
import { UserModel } from '../model/UserModel';
import { CommentState, ImageState, MomentState } from '../viewmodel/uistate/MomentState';
import { UserState } from '../viewmodel/uistate/UserState';

export function userStateMapper(userModel: UserModel): UserState {
  return new UserState(userModel.profileImage, userModel.avatar, userModel.nick, userModel.username)
}

export function imageStateMapper(imageModel: ImageModel): ImageState {
  return new ImageState(imageModel.url)
}

export function commentStateModel(commentModel: Comment): CommentState {
  return new CommentState(
    commentModel.content,
    userStateMapper(commentModel.sender)
  )
}

export function momentStateMapper(momentModel: MomentModel): MomentState {
  const imagesState = momentModel.images?.map(imageModel => {
    return imageStateMapper(imageModel)
  })

  const senderState = userStateMapper(momentModel.sender)

  const commentsState = momentModel.comments?.map(commentModel => {
    return commentStateModel(commentModel)
  })

  return new MomentState(momentModel.content, imagesState, senderState, commentsState)
}