@Observed
export class UserState {
  profileImage: string;
  avatar: string;
  nick: string;
  username: string;

  constructor(
    profileImage: string,
    avatar: string,
    nick: string,
    username: string
  ) {
    this.profileImage = profileImage;
    this.avatar = avatar;
    this.nick = nick;
    this.username = username;
  }

  isValid(): Boolean {
    return this.profileImage !== null
  }
}
