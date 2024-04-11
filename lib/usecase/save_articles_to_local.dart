import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/execute.dart';

class SaveArticlesToLocal extends Execute {

  final List<NewsArticleModel> articles;

  SaveArticlesToLocal({super.instance = 'SaveArticlesToLocal', required this.articles});

  @override
  execute() async {
    final openArticlesBox = await Hive.openBox<List<NewsArticleModel>>('${lastUID.value}_openArticles');
      
    await openArticlesBox.put('${lastUID.value}_openArticles', articles);
    
    await openArticlesBox.close();
  }
}