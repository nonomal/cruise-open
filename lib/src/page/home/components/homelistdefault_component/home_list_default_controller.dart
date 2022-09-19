import 'package:get/get.dart';

import '../../../../common/repo.dart';
import '../../../../models/Item.dart';
import '../../../../models/enumn/stories_type.dart';
import '../../../../models/request/article/article_request.dart';

class HomeListDefaultController extends GetxController {
  ArticleRequest articleRequest = new ArticleRequest(pageSize: 10, pageNum: 1, storiesType: StoriesType.topStories);
  StoriesType currentStoriesType = StoriesType.topStories;
  StoriesType lastStoriesType = StoriesType.topStories;
  var articleLoadingStatus = LoadingStatus.loading.obs;
  bool isScrollTop = false;
  var articles = List.empty(growable: true).obs;

  Future initArticles() async {
    articleRequest.pageNum = 1;
    articleRequest.offset = null;
    articleRequest.storiesType = StoriesType.favStories;
    List<Item> fetchedArticles = await Repo.getArticles(articleRequest);
    articles.value = fetchedArticles;
    articleLoadingStatus.value = LoadingStatus.complete;
    update();
  }
}
