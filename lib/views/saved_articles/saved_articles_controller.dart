import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/appstate.dart';

class SavedArticlesController extends GetxController {
  final RxList<NewsArticleModel> savedArticles = <NewsArticleModel>[].obs;
  Rx<AppState> appStateCurrent = AppState.idle.obs;

  Future<void> getSavedArticles() async {
    logYellow("Retrieving saved articles...");
    appStateCurrent.value = AppState.retrievingLocal;
    savedArticles.clear();

    final savedArticlesBox = await Hive.openBox('${lastUID.value}_openArticles_saved');

    if (savedArticlesBox.isEmpty) {
      appStateCurrent.value = AppState.idle;
      return;
    }

    final articlesList = savedArticlesBox.get('${lastUID.value}_openArticles_saved') as List<dynamic>?;

    logCyan('articlesList runtime type: ${articlesList.runtimeType}');

    if (articlesList != null) {
      for (var dynamicArticle in articlesList) {
        if (dynamicArticle is NewsArticleModel) {
          savedArticles.add(dynamicArticle);
          logGreen("Added article to saved articles (size: ${savedArticles.length})");
        } else {
          logRed("Invalid type found in articles list: ${dynamicArticle.runtimeType}");
        }
      }
    } else {
      logRed("savedArticlesBox.get('${lastUID.value}_openArticles_saved') is null");
    }

    savedArticles.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
    await savedArticlesBox.close();

    appStateCurrent.value = AppState.idle;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSavedArticles();
  }
}
