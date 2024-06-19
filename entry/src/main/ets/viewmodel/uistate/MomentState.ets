import { UserState } from './UserState'


export class ImageState {
  constructor(public url: string) {
  }
}

export class CommentState {
  constructor(
    public content: string,
    public sender: UserState
  ) {
  }
}

export class MomentState {
  constructor(
    public content: string,
    public images: ImageState[],
    public sender: UserState,
    public comments: CommentState[]
  ) {
  }
}
