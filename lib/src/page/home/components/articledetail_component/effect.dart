import 'package:cruise/src/common/article_action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:wheel/wheel.dart';
import 'action.dart';
import 'state.dart';

Effect<ArticleDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<ArticleDetailState>>{
    Lifecycle.initState: _onInit,
    //Lifecycle.build: _didUpdateWidget,
  });
}

Future _onInit(Action action, Context<ArticleDetailState> ctx) async {
  ArticleDetailState articleListState = ctx.state;
  if(articleListState.article.readStatus == false) {
    HttpResult result = await ArticleAction.read(articleId: articleListState.article.id);
    if (result.result == Result.ok) {
      ctx.dispatch(ArticleDetailActionCreator.onRead());
    }
  }
}
