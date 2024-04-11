import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/components/show_snackbar.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/execute.dart';

class RemoveSavedArticle extends Execute {

  final NewsArticleModel articleToDelete;
  final List<NewsArticleModel> savedArticles;

  RemoveSavedArticle({required this.articleToDelete, required this.savedArticles, super.instance = 'RemoveSavedArticle'});

  @override
  execute() async {
    logYellow("Removing article from saved articles...");
    ShowSnackBar(title: "Removing", message: "Removing the Article", duration: const Duration(milliseconds: 55000));

    final savedArticlesBox = await Hive.openBox('${lastUID.value}_openArticles_saved');

    final dynamicList = savedArticlesBox.get('${lastUID.value}_openArticles_saved') as List<dynamic>?;

    List<NewsArticleModel> savedArticles = <NewsArticleModel>[];

    if (dynamicList != null) {
      for (var dynamicArticle in dynamicList) {
        if (dynamicArticle is NewsArticleModel) {
          if(dynamicArticle.author == articleToDelete.author 
            && 
          dynamicArticle.title == articleToDelete.title){
            continue;
          }else{
            savedArticles.add(dynamicArticle);
          }
        } else {
          logRed("Invalid type found in saved articles list: ${dynamicArticle.runtimeType}");
        }
      }
    }

    await savedArticlesBox.put('${lastUID.value}_openArticles_saved', savedArticles);
    await savedArticlesBox.close();
    Get.back();
    ShowSnackBar(title: "Article Removed", message: "Article has been removed from Saved Articles", duration: const Duration(milliseconds: 1500));
  }
}