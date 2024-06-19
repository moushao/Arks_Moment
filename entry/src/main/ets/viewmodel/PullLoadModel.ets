import CommonConstant from '../constant/CommonConstant';
import { MomentState } from './uistate/MomentState';
import { PageState } from './uistate/PageState';


export default class PullLoadModel {
  newsData: MomentState[] = [];
  currentPage: number = 1;
  pageSize: number = CommonConstant.PAGE_SIZE;
  pullDownRefreshText: string = '刷新'
  pullDownRefreshHeight: number = CommonConstant.CUSTOM_LAYOUT_HEIGHT;
  isVisiblePullDown: boolean = false;
  pullUpLoadText: string = '加载更多'
  pullUpLoadHeight: number = CommonConstant.CUSTOM_LAYOUT_HEIGHT
  isVisiblePullUpLoad: boolean = false;
  offsetY: number = 0;
  pageState: number = PageState.Loading;
  hasMore: boolean = true;
  startIndex = 0;
  endIndex = 0;
  downY = 0;
  lastMoveY = 0;
  isRefreshing: boolean = false;
  isCanRefresh = false;
  isPullRefreshOperation = false;
  isLoading: boolean = false;
  isCanLoadMore: boolean = false;
}