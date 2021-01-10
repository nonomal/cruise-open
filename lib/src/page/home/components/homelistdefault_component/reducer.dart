import 'package:Cruise/src/models/Item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeListDefaultState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeListDefaultState>>{
      HomeListDefaultAction.loading_more_articles_update:
          _onLoadingMoreArticlesUpdate,
      HomeListDefaultAction.fetch_newest_articles_update:
          _onFetchNewestArticlesUpdate,
      HomeListDefaultAction.set_articleIds: _onSetArticleIds,
    },
  );
}

HomeListDefaultState _onAction(HomeListDefaultState state, Action action) {
  final HomeListDefaultState newState = state.clone();
  return newState;
}

HomeListDefaultState _onLoadingMoreArticlesUpdate(
    HomeListDefaultState state, Action action) {
  final HomeListDefaultState newState = state.clone();
  List<Item> articles = (action.payload as List<Item>);
  newState.articleListState.articles.addAll(articles);
  return newState;
}

HomeListDefaultState _onFetchNewestArticlesUpdate(
    HomeListDefaultState state, Action action) {
  final HomeListDefaultState newState = state.clone();
  List<Item> articles = (action.payload as List<Item>);
  newState.articleListState.articles = articles;
  return newState;
}

HomeListDefaultState _onSetArticleIds(
    HomeListDefaultState state, Action action) {
  final HomeListDefaultState newState = state.clone();
  ArticlePayload payload = (action.payload as ArticlePayload);
  newState.articleListState.articleIds = payload.articleIds;
  newState.articleRequest = payload.articleRequest;
  newState.currentStoriesType = state.currentStoriesType;
  return newState;
}
