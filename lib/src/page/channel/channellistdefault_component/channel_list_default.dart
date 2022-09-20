import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../models/Item.dart';
import '../../../models/enumn/stories_type.dart';
import '../../../models/request/article/article_request.dart';
import 'channel_list_default_controller.dart';

const APPBAR_SCROLL_OFFSET = 100;
double appBarAlpha = 0;
bool isDispatched = false;

void _onScroll(offset) {
  double alpha = offset / APPBAR_SCROLL_OFFSET;
  if (alpha < 0) {
    alpha = 0;
  } else if (alpha > 1) {
    alpha = 1;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
  appBarAlpha = alpha;
}

RefreshController _refreshController = RefreshController(initialRefresh: false);
ScrollController scrollController = ScrollController();

class ChannelListDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChannelListDefaultController>(
        init: ChannelListDefaultController(),
        builder: (controller) {
          ArticleRequest articleRequest = controller.articleRequest;
          articleRequest.storiesType = StoriesType.channels;
          StoriesType storiesType = StoriesType.channels;
          if (controller.isScrollTop) {
            // dispatch(ChannelListDefaultActionCreator.onResumeScrollTop());
            if (scrollController.hasClients) {
              scrollController.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
            }
          }

          Widget navChannelPage() {
            return Text("data"); //viewService.buildComponent("channellist");
          }

          void _loadingMoreChannel() {
            //dispatch(ChannelListDefaultActionCreator.onLoadingMoreChannels(articleRequest));
            _refreshController.loadComplete();
          }

          void _autoPreloadMoreChannels(ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              ScrollMetrics metrics = notification.metrics;
              double buttonDistance = metrics.extentAfter;
              if (buttonDistance < 800 && !isDispatched) {
                isDispatched = true;
                _loadingMoreChannel();
              }
              if (buttonDistance > 800) {
                isDispatched = false;
              }
            }
          }

          return Scaffold(
            body: SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (context) {
                  if (controller.channels.length == 0) {
                    if (controller.channelLoadingStatus == LoadingStatus.complete) {
                      // when the channel not fetched, show loading animation
                      return Center(child: Text("无内容"));
                    } else if (controller.channelLoadingStatus == LoadingStatus.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Center(child: Text("无内容"));
                    }
                  }
                  return NotificationListener(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is! ScrollNotification) {
                          return false;
                        }
                        if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                          _onScroll(scrollNotification.metrics.pixels);
                        }

                        _autoPreloadMoreChannels(scrollNotification);
                        return true;
                      },
                      child: CupertinoScrollbar(
                          child: SmartRefresher(
                              onRefresh: () {
                                _refreshController.refreshCompleted();
                              },
                              enablePullUp: true,
                              enablePullDown: true,
                              header: WaterDropMaterialHeader(),
                              controller: _refreshController,
                              onLoading: _loadingMoreChannel,
                              footer: CustomFooter(
                                builder: (BuildContext context, LoadStatus? mode) {
                                  Widget? body;
                                  if (mode == LoadStatus.idle) {
                                    body = Text("pull up load");
                                  } else if (mode == LoadStatus.loading) {
                                    //body =  CupertinoActivityIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = Text("Load Failed!Click retry!");
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = Text("release to load more");
                                  } else {
                                    body = Text("No more Data");
                                  }
                                  return Container(
                                    height: 55.0,
                                    child: Center(child: body),
                                  );
                                },
                              ),
                              child: CustomScrollView(
                                controller: scrollController,
                                key: PageStorageKey(storiesType),
                                slivers: <Widget>[
                                  SliverOverlapInjector(
                                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                                      context,
                                    ),
                                  ),
                                  if (controller.channels.length > 0)
                                    SliverPadding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      sliver: navChannelPage(),
                                    )
                                ],
                              ))));
                },
              ),
            ),
          );
        });
  }
}
