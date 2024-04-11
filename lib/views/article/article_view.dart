import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/components/article_page_head.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/article/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  ArticleView({super.key, required this.article});
  final NewsArticleModel article;

  @override
  final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title!),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title!, style: newspaceTitleStyle,),
                const SizedBox(height: 12,),
                ArticlePageHead(article: article,),
                const SizedBox(height: 12,),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Author", style: newspaceThinStyle,),
                                Text(article.author!, style: newspaceArticleTitleStyleX,),
                              ],
                            )
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text("Published", style: newspaceThinStyle,),
                                Text("${(article.publishedAt!.toDate()).day}/${(article.publishedAt!.toDate()).month}/${(article.publishedAt!.toDate()).year}", style: newspaceArticleTitleStyleX,),
                              ],
                            )
                          ),
                        ]
                      ),
                      const SizedBox(height: 12,),
                      Text(article.description!),
                      const SizedBox(height: 12,),
                      Text(article.content!),
                      const SizedBox(height: 12,),
                      TextButton(
                        onPressed: () => controller.launchWeb(article.url!), 
                        child: Text(
                          'Read More on ${article.sourceName}'
                        )
                      )
                    ],
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }
}