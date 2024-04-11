import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/components/show_snackbar.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/execute.dart';

class SaveArticleReadLater extends Execute {
  final NewsArticleModel article;
  SaveArticleReadLater({required this.article, super.instance = 'SaveArticleReadLater'});

  bool doesExist = false;
  @override
  execute() async {
    logYellow("Saving article to read later...");
    ShowSnackBar(title: "Saving", message: "Saving the Article", duration: const Duration(milliseconds: 1500));

    final savedArticlesBox = await Hive.openBox('${lastUID.value}_openArticles_saved');

    final dynamicList = savedArticlesBox.get('${lastUID.value}_openArticles_saved') as List<dynamic>?;

    List<NewsArticleModel> savedArticles = <NewsArticleModel>[];

    if (dynamicList != null) {
        for (var dynamicArticle in dynamicList) {
            if (dynamicArticle is NewsArticleModel) {
                if(dynamicArticle.author == article.author 
                  && 
                dynamicArticle.title == article.title){
                  doesExist = true;
                  break;
                }else{
                  doesExist = false;
                  savedArticles.add(dynamicArticle);
                }

            } else {
                logRed("Invalid type found in saved articles list: ${dynamicArticle.runtimeType}");
            }
        }
    }

    if(doesExist){
      Get.back();
      ShowSnackBar(title: "Article Exists", message: "Article already saved to read later", duration: const Duration(milliseconds: 1500));
    }else{
      savedArticles.add(article);

      await savedArticlesBox.put('${lastUID.value}_openArticles_saved', savedArticles);

      await savedArticlesBox.close();

      Get.back();
      ShowSnackBar(title: "Saved", message: "Article saved to read later", duration: const Duration(milliseconds: 1500));
    }
    
  }
}
