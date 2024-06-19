import { HttpRequestGet } from '../http/HttpRequest';
import { MomentModel } from '../model/MomentModel';
import { UserModel } from '../model/UserModel';

class MomentRepository {
  public getUser(): Promise<UserModel> {
    return new Promise((resolve: Function) => {
      HttpRequestGet<UserModel>("https://xianmobilelab.gitlab.io/moments-data/user.json").then((data: UserModel) => {
        if (data !== null) {
          resolve(data)
        }
      }).catch(error => {
        console.log("getUser exception with error:" + error)
      })
    })
  }

  public getMomentList(): Promise<MomentModel[]> {
    return new Promise((resolve: Function) => {
      HttpRequestGet<MomentModel[]>("https://xianmobilelab.gitlab.io/moments-data/tweets.json").then((data: MomentModel[]) => {
        if (data !== null) {
          const filterData = data.filter(item => (!('error' in item) && !('unknown error' in item)))
          resolve(filterData)
        }
      }).catch(error => {
        console.log("getMomentList exception with error:" + error)
      })
    })
  }
}

export default new MomentRepository()