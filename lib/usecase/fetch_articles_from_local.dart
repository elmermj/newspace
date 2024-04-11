import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/appstate.dart';
import 'package:newspace/utils/execute.dart';

class FetchArticleFromLocal extends Execute{
  Rx<AppState> state;
  RxList<NewsArticleModel> newsArticles;

  FetchArticleFromLocal({required this.state, required this.newsArticles, super.instance = 'FetchArticleFromLocal'});

  @override
  execute() async {
    state.value = AppState.retrievingLocal;
    final openArticlesBox = await Hive.openBox('${lastUID.value}_openArticles');

    List<dynamic>? retrievedData = openArticlesBox.get('${lastUID.value}_openArticles');

    List<NewsArticleModel> localArticles = [];

    if (retrievedData != null) {
        for (var articleData in retrievedData) {
            if (articleData is Map<String, dynamic>) {
                NewsArticleModel article = NewsArticleModel.fromJson(articleData);
                if(article.region == selectedRegion.value){
                  localArticles.add(article);
                }
            }
        }
    }

    newsArticles.clear();
    newsArticles.addAll(localArticles);

    await openArticlesBox.close();
  }
}