import promptAction from '@ohos.promptAction';
import CommonConstant from '../constant/CommonConstant';
import PullLoadModel from '../viewmodel/PullLoadModel';
import { RefreshState } from '../viewmodel/uistate/PageState';
import { touchMoveLoadMore, touchUpLoadMore } from './PullUpLoadMore';

export function listTouchEvent(pullLoadModel: PullLoadModel, event: TouchEvent, refresh: () => void, loadMore: () => void) {
  switch (event.type) {
    case TouchType.Down:
      pullLoadModel.downY = event.touches[0].y;
      pullLoadModel.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Move:
      if ((pullLoadModel.isRefreshing === true) || (pullLoadModel.isLoading === true)) {
        return;
      }
      let isDownPull = event.touches[0].y - pullLoadModel.lastMoveY > 0;
      if (((isDownPull === true) || (pullLoadModel.isPullRefreshOperation === true)) && (pullLoadModel.isCanLoadMore === false)) {
        touchMovePullRefresh(pullLoadModel, event);
      } else {
        touchMoveLoadMore(pullLoadModel, event);
      }
      pullLoadModel.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Cancel:
      break;
    case TouchType.Up:
      if ((pullLoadModel.isRefreshing === true) || (pullLoadModel.isLoading === true)) {
        return;
      }
      if ((pullLoadModel.isPullRefreshOperation === true)) {
        touchUpPullRefresh(pullLoadModel, refresh);
      } else {
        touchUpLoadMore(pullLoadModel, loadMore);
      }
      break;
    default:
      break;
  }
}

export function touchMovePullRefresh(newsModel: PullLoadModel, event: TouchEvent) {
  if (newsModel.startIndex === 0) {
    newsModel.isPullRefreshOperation = true;
    let height = vp2px(newsModel.pullDownRefreshHeight);
    newsModel.offsetY = event.touches[0].y - newsModel.downY;
    if (newsModel.offsetY >= height) {
      pullRefreshState(newsModel, RefreshState.Release);
      newsModel.offsetY = height + newsModel.offsetY * 0.1
    } else {
      pullRefreshState(newsModel, RefreshState.DropDown);
    }
    if (newsModel.offsetY < 0) {
      newsModel.offsetY = 0;
      newsModel.isPullRefreshOperation = false;
    }
  }
}

export function touchUpPullRefresh(newsModel: PullLoadModel, refresh: () => void) {
  if (newsModel.isCanRefresh === true) {
    newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
    pullRefreshState(newsModel, RefreshState.Refreshing);
    newsModel.currentPage = 1;
    setTimeout(() => {
      refresh()
    }, CommonConstant.DELAY_TIME);
  } else {
    closeRefresh(newsModel, false);
  }
}

export function pullRefreshState(newsModel: PullLoadModel, state: number) {
  switch (state) {
    case RefreshState.DropDown:
      newsModel.isCanRefresh = false;
      newsModel.isRefreshing = false;
      newsModel.isVisiblePullDown = true;
      break;
    case RefreshState.Release:
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = false;
      break;
    case RefreshState.Refreshing:
      newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    case RefreshState.Success:
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    case RefreshState.Fail:
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    default:
      break;
  }
}

export function closeRefresh(newsModel: PullLoadModel, isRefreshSuccess: boolean) {
  let self = newsModel;
  setTimeout(() => {
    let delay = CommonConstant.RefreshConstant_DELAY_PULL_DOWN_REFRESH;
    if (self.isCanRefresh === true) {
      pullRefreshState(newsModel, isRefreshSuccess ? RefreshState.Success : RefreshState.Fail);
      delay = CommonConstant.RefreshConstant_DELAY_SHRINK_ANIMATION_TIME;
    }
    animateTo({
      duration: CommonConstant.RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME,
      delay: delay,
      onFinish: () => {
        pullRefreshState(newsModel, RefreshState.DropDown);
        self.isVisiblePullDown = false;
        self.isPullRefreshOperation = false;
      }
    }, () => {
      self.offsetY = 0;
    })
  }, self.isCanRefresh ? CommonConstant.DELAY_ANIMATION_DURATION : 0)
}