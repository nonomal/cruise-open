import 'package:Cruise/src/common/Repo.dart';
import 'package:Cruise/src/component/channel_list.dart';
import 'package:Cruise/src/component/loading_item.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

/*final storiesTypeProvider = FutureProvider.family((ref, articleRequest) async {
  return await Repo.getArticles(articleRequest);
});*/

Widget buildView(ChannelsState state, Dispatch dispatch, ViewService viewService) {
  /*return Consumer(
        (context, read) {
      return read(storiesTypeProvider(state.articleRequest)).when(
        loading: () {
          // return SliverFillRemaining(
          // child: Center(child: CircularProgressIndicator()));
          return SliverToBoxAdapter(child: Center(child: LoadingItem()));
        },
        error: (err, stack) {
          print(err);
          return SliverToBoxAdapter(
              child: Center(child: Text('Error: $err')));
        },
        data: (ids) {
          return ChannelList(ids: ids);
        },
      );
    },
  );*/
}
