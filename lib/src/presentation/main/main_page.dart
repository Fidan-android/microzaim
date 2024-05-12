import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microzaim/src/config/app_route.gr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context)
                        .push(const ArticleForRussiaRoute()),
                    child: Card(
                      elevation: 0,
                      color: const Color(0xFFF1F1F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SizedBox(
                        height: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Card(
                                    color: Colors.white,
                                    child: SizedBox(
                                      width: 46,
                                      height: 46,
                                      child: Center(
                                        child: Text(
                                          '🇷🇺',
                                          style: TextStyle(fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.33,
                                  child: SizedBox(
                                    height: 90,
                                    child: SvgPicture.asset(
                                      "assets/images/main/ic_russian.svg",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "Сводка\nзаконодательств\nРФ",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context)
                        .pushNamed("/article-for-kazakhstan-page"),
                    child: Card(
                      elevation: 0,
                      color: const Color(0xFFF1F1F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SizedBox(
                        height: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Card(
                                    color: Colors.white,
                                    child: SizedBox(
                                      width: 46,
                                      height: 46,
                                      child: Center(
                                        child: Text(
                                          '🇰🇿',
                                          style: TextStyle(fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 90,
                                  child: SvgPicture.asset(
                                    "assets/images/main/ic_kazakhstan.svg",
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "Сводка\nзаконодательств\nКЗ",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_first.png",
              titleOfArticle: "Можно ли не платить микрозайм законно",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 1)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_second.png",
              titleOfArticle: "Что будет, если не платить микрозайм",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 2)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_third.png",
              titleOfArticle: "Когда МФО нарушают закон",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 3)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_fourth.png",
              titleOfArticle: "Как работает закон о банкротстве",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 4)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_fifth.png",
              titleOfArticle: "Что делать с унаследованным займом",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 5)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_sixth.png",
              titleOfArticle: "Истечение срока давности",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 6)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_seventh.png",
              titleOfArticle: "Советы от юриста",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 7)),
            ),
            ArticleWidget(
              imageOfArticle: "assets/images/main/ic_eighth.png",
              titleOfArticle: "Мифы о неуплате по займам",
              onTap: () =>
                  AutoRouter.of(context).push(ArticleRoute(numberOfArticle: 8)),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {Key? key,
      required this.imageOfArticle,
      required this.titleOfArticle,
      required this.onTap})
      : super(key: key);

  final String imageOfArticle;
  final String titleOfArticle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Card(
          elevation: 0,
          color: const Color(0xFFF1F1F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: SizedBox(
            height: 99,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: Image.asset(
                            imageOfArticle,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        titleOfArticle,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                        "assets/images/main/ic_arrow_right.svg"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
