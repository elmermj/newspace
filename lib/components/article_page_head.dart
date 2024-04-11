import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/models/news_article_model.dart';
import 'package:newspace/utils/constants.dart';

class ArticlePageHead extends StatelessWidget {
  const ArticlePageHead({
    super.key,
    required this.article,
  });

  final NewsArticleModel article;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: Get.width - 16,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: Stack(
            children: [
              article.urlToImage != null? 
              SizedBox.expand(
                child: article.localImagePath == ''? Image.network(article.urlToImage!, fit: BoxFit.fitWidth,): Image.file(File(article.localImagePath!), fit: BoxFit.fill,)
              ):
              SizedBox.expand(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      "Image Is Not Provided by The News Source",
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Get.theme.colorScheme.onPrimary,
                      )
                    )
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [
                      0.0,
                      0.8,
                    ]
                  )
                )
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        article.title?? '',
                        maxLines: 3,
                        style: newspaceArticleTitleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AutoSizeText(
                        article.description?? '',
                        maxLines: 3,
                        style: newspaceArticleSubTitleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}

