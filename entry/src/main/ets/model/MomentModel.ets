import { UserModel } from './UserModel'

export class ImageModel {
  constructor(public url: string) {
  }
}

export class Comment {
  constructor(
    public content: string,
    public sender: UserModel
  ) {
  }
}

export class MomentModel {
  constructor(
    public content: string,
    public images: ImageModel[],
    public sender: UserModel,
    public comments: Comment[]
  ) {
  }
}