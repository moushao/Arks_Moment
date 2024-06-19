import CommonConstant from '../constant/CommonConstant';
import PullLoadModel from '../viewmodel/PullLoadModel';

export function touchMoveLoadMore(pullLoadModel: PullLoadModel, event: TouchEvent) {
  if (pullLoadModel.endIndex === pullLoadModel.newsData.length - 1 || pullLoadModel.endIndex === pullLoadModel.newsData.length) {
    pullLoadModel.offsetY = event.touches[0].y - pullLoadModel.downY;
    if (Math.abs(pullLoadModel.offsetY) > vp2px(pullLoadModel.pullUpLoadHeight) / 2) {
      pullLoadModel.isCanLoadMore = true;
      pullLoadModel.isVisiblePullUpLoad = true;
      pullLoadModel.offsetY = -vp2px(pullLoadModel.pullUpLoadHeight) + pullLoadModel.offsetY * 0.1
    }
  }
}

export function touchUpLoadMore(pullLoadModel: PullLoadModel, loadMore: () => void) {
  let self: PullLoadModel = pullLoadModel;
  console.log("touchUpLoadMore")
  animateTo({
    duration: CommonConstant.ANIMATION_DURATION,
  }, () => {
    self.offsetY = 0;
  })
  setTimeout(() => {
    loadMore()
    pullLoadModel.isVisiblePullUpLoad = true
  }, CommonConstant.DELAY_TIME);

}

export function closeLoadMore(pullLoadModel: PullLoadModel) {
  pullLoadModel.isCanLoadMore = false;
  pullLoadModel.isLoading = false;
  pullLoadModel.isVisiblePullUpLoad = false;
}