import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/components/article_cover.dart';
import 'package:newspace/components/custom_list_modal_bottom_sheet.dart';
import 'package:newspace/components/custom_prompt_modal_bottom_sheet.dart';
import 'package:newspace/components/page_head.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/models/regions.dart';
import 'package:newspace/usecase/save_article_read_later.dart';
import 'package:newspace/utils/appstate.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/article/article_view.dart';
import 'package:newspace/views/home/home_controller.dart';
import 'package:newspace/views/profile/profile_view.dart';
import 'package:rive/rive.dart' as rive;

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: Get.width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: kToolbarHeight,
                width: kToolbarHeight,
                child: Get.isDarkMode? const rive.RiveAnimation.asset(
                  'assets/animations/tristructure - white.riv',
                  fit: BoxFit.fitHeight,
                ):const rive.RiveAnimation.asset(
                  'assets/animations/tristructure.riv',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text('Newspace'),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(()=>ProfileView());
            }, 
            icon: const Icon(Icons.person)
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHead(
                  controller: controller.searchController,
                  onSubmitted: (String value) {
                    controller.isSearching.value = true;
                    controller.searchQuery.value = value;
                    controller.fetchNews();
                  }
                ),
                Obx(
                  ()=> Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.isSearching.value ? GestureDetector(
                          onTap: (){
                            controller.isSearching.value = false;
                            controller.pageNum.value = 0;
                            controller.fetchNews();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_back_ios_new_rounded),
                              SizedBox(width: 8),
                              Text(
                                'Search Result',
                                style: newspaceTitleStyle,
                              ),
                            ],
                          )
                        ):
                        const Text(
                          'Top Headlines',
                          style: newspaceTitleStyle,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Get.theme.colorScheme.secondary,
                          ),
                          onPressed: (){
                            CustomListModalBottomSheet(
                              context: context, 
                              title: "Change Region",
                              height: Get.height * 0.25,
                              itemCount: regions.length, 
                              itemBuilder: (context, index){
                                return GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      "${regions[index].code.toUpperCase()} - ${regions[index].name}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ),
                                  onTap: (){
                                    selectedRegion.value = regions[index].code;
                                    Get.back();
                                  },
                                );
                              }
                            );
                          }, 
                          child: Text(
                            selectedRegion.value.toUpperCase(),
                            style: newspaceTitleStyle,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () {
                      switch(appState.value){
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
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: controller.newsArticles.length+1,
                            itemBuilder: (context, index) {

                              if(controller.newsArticles.isEmpty){
                                return const Center(
                                  child: Text("No News Articles Found"),
                                );
                              }
                          
                          
                              if(index == controller.newsArticles.length && index != 0){
                                return GestureDetector(
                                  child: SizedBox(
                                    height: 90,
                                    width: Get.width,
                                    child: const Center(
                                      child: Text(
                                        "Load More",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    controller.pageNum.value ++;
                                    controller.fetchNews();
                                  },
                                );
                              }else {
                                logYellow("INDEX NUMBER ::: $index");
                                NewsArticleModel article = controller.newsArticles[index];
                          
                                Duration timeDifference = DateTime.now().subtract(const Duration(days: 1)).difference(article.publishedAt!.toDate());
                                            
                                String timeAgo;
                                if (timeDifference.inMinutes < 60) {
                                  timeAgo = "${timeDifference.inMinutes} minutes ago";
                                } else if (timeDifference.inHours < 24) {
                                  timeAgo = "${timeDifference.inHours} hours ago";
                                } else {
                                  timeAgo = "${timeDifference.inDays} days ago";
                                }

                                return GestureDetector(
                                  onTap: ()=>Get.to(()=>ArticleView(article: article,)),
                                  onLongPress: () => CustomPromptModalBottomSheet(
                                    context: context, 
                                    title: "Save it for later?", 
                                    leftOption: "Yes", 
                                    rightOption: "No", 
                                    leftOnTap: () {
                                      SaveArticleReadLater(article: article);
                                      Get.back();
                                    }, 
                                    rightOnTap: ()=>Get.back(), 
                                    highlight: false
                                  ),
                                  child: ArticleCover(
                                    tooltip: "Hold to Save Article", article: article, timeAgo: timeAgo)
                                );
                              }
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
              ],
            )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => controller.fetchNews(),
        child: const Icon(Icons.refresh_rounded),
      )
    );
  }
}

