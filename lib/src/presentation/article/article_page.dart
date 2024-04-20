import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/presentation/article/items/eighth_article.dart';
import 'package:microzaim/src/presentation/article/items/fifth_article.dart';
import 'package:microzaim/src/presentation/article/items/first_article.dart';
import 'package:microzaim/src/presentation/article/items/fourth_article.dart';
import 'package:microzaim/src/presentation/article/items/second_article.dart';
import 'package:microzaim/src/presentation/article/items/seventh_article.dart';
import 'package:microzaim/src/presentation/article/items/sixth_article.dart';
import 'package:microzaim/src/presentation/article/items/third_article.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.numberOfArticle})
      : super(key: key);

  final int numberOfArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => AutoRouter.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Статья",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 22),
                      ),
                    ),
                    SizedBox.fromSize(size: const Size(20, 20)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: configureTextOfArticle(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget configureTextOfArticle(BuildContext context) {
    switch (numberOfArticle) {
      case 1:
        {
          return const FirstArticleItem();
        }
      case 2:
        {
          return const SecondArticleItem();
        }
      case 3:
        {
          return const ThirdArticleItem();
        }
      case 4:
        {
          return const FourthArticleItem();
        }
      case 5:
        {
          return const FifthArticleItem();
        }
      case 6:
        {
          return const SixthArticleItem();
        }
      case 7:
        {
          return const SeventhArticleItem();
        }
      case 8:
        {
          return const EighthArticleItem();
        }
      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
