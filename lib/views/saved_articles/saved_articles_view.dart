import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/components/article_cover.dart';
import 'package:newspace/components/custom_prompt_modal_bottom_sheet.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/usecase/remove_saved_article.dart';
import 'package:newspace/utils/appstate.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/saved_articles/saved_articles_controller.dart';

class SavedArticleView extends GetView<SavedArticlesController> {
  SavedArticleView({super.key});

  @override
  final SavedArticlesController controller = Get.put(SavedArticlesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Saved Articles', style: newspaceTitleStyle,),
                const SizedBox(height: 24,),
                Expanded(
                  child: Obx(
                    () {
                      switch(controller.appStateCurrent.value){
                        case AppState.retrievingLocal:
                          return const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text("Retrieving Local Data"),
                              ],
                            ),
                          );
                        case AppState.fetchingRemote:
                          return const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text("Fetching Data From News API"),
                              ],
                            ),
                          );
                        case AppState.downloadingImage:
                          return const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text("Downloading Images"),
                              ],
                            ),
                          );
                        case AppState.savingToLocal:
                          return const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text("Saving Data to Local Storage"),
                              ],
                            ),
                          );
                        case AppState.idle:
                          return controller.savedArticles.value.length == 0?
                          const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.error, size: 100,),
                                Text("No Saved Articles"),
                              ],
                            )
                          ):
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: controller.savedArticles.value.length,
                            itemBuilder: (context, index) {
                              logYellow("INDEX NUMBER ::: $index");
                              // Access the article at the current index
                              NewsArticleModel article = controller.savedArticles[index];
                        
                              Duration timeDifference = DateTime.now().subtract(const Duration(days: 1)).difference(article.publishedAt!.toDate());
                                          
                              // Convert time difference to a human-readable format
                              String timeAgo;
                              if (timeDifference.inMinutes < 60) {
                                timeAgo = "${timeDifference.inMinutes} minutes ago";
                              } else if (timeDifference.inHours < 24) {
                                timeAgo = "${timeDifference.inHours} hours ago";
                              } else {
                                timeAgo = "${timeDifference.inDays} days ago";
                              }
                              return GestureDetector(
                                child: ArticleCover(
                                  tooltip: "Hold to Delete Saved Article",
                                  article: article, timeAgo: timeAgo
                                ),
                                onLongPress: ()=> CustomPromptModalBottomSheet(
                                  context: context, 
                                  title: "Are you sure you want to remove this article from saved articles?", 
                                  rightOption: "No", 
                                  leftOption: "Yes", 
                                  rightOnTap: ()=>Get.back(), 
                                  leftOnTap: (){
                                    RemoveSavedArticle(articleToDelete: article, savedArticles: controller.savedArticles);
                                    controller.getSavedArticles();
                                  }, 
                                  highlight: true
                                )
                              );
                            },
                          );
                        default:
                          return const Center(
                            child: Text("Error"),
                          );
                      }
                    }
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