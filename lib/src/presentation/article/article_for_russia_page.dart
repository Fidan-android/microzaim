import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleForRussiaPage extends StatefulWidget {
  const ArticleForRussiaPage({super.key});

  @override
  State<ArticleForRussiaPage> createState() => _ArticleForRussiaPageState();
}

class _ArticleForRussiaPageState extends State<ArticleForRussiaPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InternalPageTemplate(
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 12, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => AutoRouter.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Card(
                        color: const Color(0xFFF1F1F1),
                        child: SizedBox(
                          width: 46,
                          height: 46,
                          child: Center(
                            child: Text(
                              "🇷🇺",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(size: const Size(20, 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Сводка по законодательству России о микрозаймах, микрокредитах и займах онлайн",
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Основные законодательные акты",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '1.\tФедеральный закон "О микрофинансовой деятельности и микрофинансовых '
                    'организациях" № 151-ФЗ от 2 июля 2010 года.\n\t\t- Устанавливает основы регулирования деятельности микрофинансовых организаций (МФО), включая требования к осуществлению '
                    'микрофинансовой деятельности, права и обязанности МФО и заёмщиков.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w400, wordSpacing: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '2. \tФедеральный закон "О потребительском кредите (займе)" № 353-ФЗ от 21 '
                    'декабря 2013 года.\n\t\t\t- Регламентирует отношения, возникающие при'
                    ' предоставлении займов физическим лицам, в том числе микрокредитов, и '
                    'устанавливает права и обязанности сторон потребительского кредитования.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w400, wordSpacing: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Основные правила и требования",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '- \tЛицензирование микрофинансовых организаций:\tМФО обязаны получать лицензию '
                    'Центрального банка Российской Федерации для осуществления микрофинансовой '
                    'деятельности.'
                    '\n-\t Пределы процентных ставок:\tЗаконодательством установлены предельные значения'
                    ' полной стоимости займа для защиты прав потребителей и предотвращения случаев '
                    'чрезмерного удорожания кредита.'
                    '\n-\tТребования к договору микрозайма:\tДоговор микрозайма должен быть составлен в '
                    'письменной форме и содержать все существенные условия, включая размер займа, '
                    'процентную ставку, сроки и порядок возврата займа, а также полную стоимость займа '
                    'для потребителя.'
                    '\n-\tРаскрытие информации:\tМФО обязаны раскрывать полную и достоверную информацию '
                    'о предлагаемых услугах, включая условия займа и возможные риски.'
                    '\n-\tЗащита прав потребителей:\tЗаемщики имеют право на получение полной информации '
                    'о займе, включая полную стоимость кредита, и защиту своих прав в случае '
                    'возникновения спорных ситуаций.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w400, wordSpacing: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Обязанности заемщиков",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '-\tСвоевременное исполнение обязательств:\tЗаемщики обязаны своевременно возвращать '
                    'заемные средства и выплачивать проценты в соответствии с условиями договора.'
                    '\n-\tПредоставление достоверной информации:\tПри обращении за микрозаймом заемщики'
                    ' должны предоставлять МФО точную и полную информацию о своем финансовом положении.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w400, wordSpacing: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Рекомендации для потребителей",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '1. Внимательно изучайте условия договора перед его подписанием, обращая особое '
                              'внимание на процентную ставку, срок займа и полную стоимость займа.'
                              '\n2. Сравнивайте предложения различных МФО, используя независимые ресурсы и '
                              'платформы для сравнения условий займов.\n3. Как обезопасить себя от мошенников.'
                              ' Прежде чем обращаться в МФО необходимо убедиться, что она работает легально. '
                              'Каждая такая организация входит в реестр компаний, которые могут работать на '
                              'финансовом рынке. Реестр находится по адресу ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400, wordSpacing: 12),
                        ),
                        TextSpan(
                          text: 'www.cbr.ru/fmp_check',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 12,
                                  decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(
                                  Uri.parse("https://www.cbr.ru/finorg/"));
                            },
                        ),
                        TextSpan(
                          text:
                              '. Нелегальные кредиторы могут выдавать себя за микрофинансовые организации, '
                              'поэтому не подписывайте никаких договоров с организациями, которых нет в реестре.',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400, wordSpacing: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
