import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:newspace/models/news_article_model.dart';

class NewsArticleModelAdapter extends TypeAdapter<NewsArticleModel> {
  @override
  final int typeId = 1;

  @override
  NewsArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsArticleModel(
      title: fields[0] as String?,
      author: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      urlToImage: fields[4] as String?,
      publishedAt: fields[5] as Timestamp?,
      content: fields[6] as String?,
      sourceId: fields[7] as String?,
      sourceName: fields[8] as String?,
      localImagePath: fields[9] as String?,
      region: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsArticleModel obj) {
    writer
     ..writeByte(11)
     ..writeByte(0)
     ..write(obj.title)
     ..writeByte(1)
     ..write(obj.author)
     ..writeByte(2)
     ..write(obj.description)
     ..writeByte(3)
     ..write(obj.url)
     ..writeByte(4)
     ..write(obj.urlToImage)
     ..writeByte(5)
     ..write(obj.publishedAt)
     ..writeByte(6)
     ..write(obj.content)
     ..writeByte(7)
     ..write(obj.sourceId)
     ..writeByte(8)
     ..write(obj.sourceName)
     ..writeByte(9)
     ..write(obj.localImagePath)
     ..writeByte(10)
     ..write(obj.region);
  }
}