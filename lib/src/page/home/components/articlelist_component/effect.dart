import 'package:Cruise/src/common/Repo.dart';
import 'package:Cruise/src/models/Item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ArticleListState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleListState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.build: _didUpdateWidget,
    Lifecycle.didUpdateWidget: _onA,
  });
}

void _onA(Action action, Context<ArticleListState> ctx) async {}

void _didUpdateWidget(Action action, Context<ArticleListState> ctx) async {}

Future _onInit(Action action, Context<ArticleListState> ctx) async {
  fetchArticles(action, ctx);
}

Future fetchArticles(Action action, Context<ArticleListState> ctx) async {
  ArticleListState articleListState = ctx.state;
  List<int> ids = articleListState.articleIds;
  if (ids == null || ids.length == 0) {
    return;
  }
  List<Item> articles = new List();
  for (int id in ids) {
    Item article = await Repo.fetchArticleItem(id);
    if (article != null) {
      articles.add(article);
    }
  }

  if (articles != null && articles.length > 0) {
    ctx.dispatch(ArticleListActionCreator.onSetArticles(articles));
  }
}
