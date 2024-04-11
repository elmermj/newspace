import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/apis.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:http/http.dart' as http;
import 'package:newspace/usecase/fetch_articles_from_local.dart';
import 'package:newspace/usecase/save_articles_to_local.dart';
import 'package:newspace/utils/appstate.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<NewsArticleModel> newsArticles = <NewsArticleModel>[].obs;
  RxString searchQuery = ''.obs;
  RxInt pageNum = 1.obs;
  RxBool isSearching = false.obs;
  RxBool isLoading = false.obs;
  late Box<List<NewsArticleModel>> openArticlesBox;

  Future<void> fetchNews() async {
    FetchArticleFromLocal(newsArticles: newsArticles, state: appState, instance: 'FetchArticleFromLocal');

    try {
      
      logGreen("newsArticles.length: ${newsArticles.length}");
      
      final response = await http.get(
        Uri.parse(
          isSearching.value?
          'https://newsapi.org/v2/everything?q=${searchQuery.value}&apiKey=${APIs.newsAPIKey}&pageSize=10&page=${pageNum.value}'
          :
          'https://newsapi.org/v2/top-headlines?country=${selectedRegion.value}&apiKey=${APIs.newsAPIKey}'),
      );
      appState.value = AppState.fetchingRemote;
      if (response.statusCode == 200) {
        logGreen("STATUS CODE ::: ${response.statusCode}");
        
        Map<String, dynamic> jsonResponse = json.decode(response.body);
      
        List<dynamic> articlesJson = jsonResponse['articles'];
        logPink(articlesJson.toString());
        List<NewsArticleModel> fetchedArticles = [];
        
        for (var articleJson in articlesJson) {
          NewsArticleModel article = NewsArticleModel.fromJson(articleJson);

          if (
            article.urlToImage != null && 
            permissionGranted.value == true && 
            Platform.isAndroid &&
            await File(article.localImagePath!).exists() == false
          ) {
            String localImagePath = await downloadAndSaveImage(
                                            article.urlToImage!,
                                            "${article.author ?? 'null'}_${article.title!}"
                                          );
            article.localImagePath = localImagePath;
          }

          article.region = isSearching.value? 'global' : selectedRegion.value;

          fetchedArticles.add(article);
        }

        logYellow("NEW ARTICLES LENGTH ::: ${fetchedArticles.length}");

        List<NewsArticleModel> combinedArticles = newsArticles.value + fetchedArticles;
        combinedArticles.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));

        newsArticles.value = combinedArticles;

        logYellow("newsArticles.length: ${newsArticles.length}");

        SaveArticlesToLocal(articles: combinedArticles);
      }
      appState.value = AppState.idle;
    } on Exception catch (e) {
      logRed("ERROR FETCHING NEWS: $e");
      appState.value = AppState.idle;
    }
  }

  Future<String> downloadAndSaveImage(
    String imageUrl,
    String localPath,
  ) async {
    appState.value = AppState.downloadingImage;
    List<String> invalidChars = ["/",'\\', '?', '%', '*', ':', '|', '"', '<', '>', '.', "'", " "];

    try{
      for (var char in invalidChars) {
        localPath = localPath.replaceAll(char, '');
      }
      logYellow("localPath: $localPath");

      Directory? directory = await getExternalStorageDirectory();

      if (directory == null) {
          return '';
      }
      final imageFolderPath = '${directory.path}/images';

      Directory imagesFolder = Directory(imageFolderPath);
      if (!imagesFolder.existsSync()) {
          imagesFolder.createSync();
      }

      final imagePath = '$imageFolderPath/$localPath.jpg';

      if (imageUrl.isEmpty || await File(imagePath).exists()) return '';

      final response = await http.get(Uri.parse(imageUrl));
      
      if (response.statusCode == 200) {
          await File(imagePath).writeAsBytes(response.bodyBytes);
          logPink("bodybytes ::: ${response.bodyBytes}");
          logGreen("SUCCESS!! IMAGE DOWNLOADED TO: $imagePath");
          return imagePath;
      }else{
        logRed('ERROR DOWNLOADING IMAGE: ${response.statusCode}');
      }
    }on Exception catch(e){
      logRed("ERROR DOWNLOADING IMAGE: $e");
    }
    return '';
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    logGreen("LAST UID  ::: ${lastUID.value}");
    await fetchNews();
  }
}