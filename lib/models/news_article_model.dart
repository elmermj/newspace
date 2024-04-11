import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class NewsArticleModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? urlToImage;
  @HiveField(5)
  Timestamp? publishedAt;
  @HiveField(6)
  String? content;
  @HiveField(7)
  String? sourceId;
  @HiveField(8)
  String? sourceName;
  @HiveField(9)
  String? localImagePath;
  @HiveField(10)
  String? region;


  NewsArticleModel({
    this.title,
    this.author,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.sourceId,
    this.sourceName,
    this.localImagePath,
    this.region
  });

  NewsArticleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = Timestamp.fromDate(DateTime.parse(json['publishedAt']));
    content = json['content'];
    sourceId = json['source']['id'];
    sourceName = json['source']['name'];
    localImagePath = '';
    region = '';
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['title'] = title;
  //   data['author'] = author;
  //   data['description'] = description;
  //   data['url'] = url;
  //   data['urlToImage'] = urlToImage;
  //   data['publishedAt'] = publishedAt;
  //   data['content'] = content;
  //   data['sourceId'] = sourceId;
  //   data['sourceName'] = sourceName;
  //   return data;
  // }
}