import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavArticleAction { action, change_story_type, initial_state_cache }

class FavArticleActionCreator {
  static Action onAction() {
    return const Action(FavArticleAction.action);
  }

  static Action onChangeStoryType() {
    return Action(FavArticleAction.change_story_type);
  }

  static Action onInitialStateCache() {
    return Action(FavArticleAction.initial_state_cache);
  }
}
