import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../custom/bulleted_item.dart';

class FourthArticleItem extends StatelessWidget {
  const FourthArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(47),
              child: Image.asset(
                "assets/images/main/ic_fourth.png",
                height: 154,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            "Как работает закон о банкротстве",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Если человек имеет слишком много долгов и не справляется с их выплатой, то он может требовать '
            'признания себя банкротом. Такая возможность существует с 1 июля 2015 года.'
            '\nЧеловек может быть признан банкротом в сдебном порядке, если:',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Сумма его долгов превышает 500 000 рублей',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Последняя выплата была совершена более трех месяцев назад',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '1 сентября вступил в силу ',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'Федеральный закон № 289-ФЗ ',
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse(
                      "https://www.consultant.ru/document/cons_doc_LAW_358781/"));
                },
            ),
            TextSpan(
              text:
                  'от 31 июля 2020 года, согласно которому гражданин может быть признан банкротом во внесудебном порядке при соблюдении следующих условий:',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        BulletedItem(
          child: Text(
            'Сумма его долгов составляет от 50 000 до 500 000 рублей',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'В отношении заемщика окончено исполнительное производство в связи с возвращением исполнительного документа',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'Чтобы начать процедуру оформления банкротства через суд, необходимо подтвердить неспособность расплатиться по долгам. Для этого описывается все имущество, собираются сведения о доходах и расходах.'
          '\nВ первую очередь суд предложит реструктурировать долг — заключить новый договор на долгий срок с меньшими процентами. Если в реструктуризации будет отказано, долг будет оплачиваться за счет имущества должника.'
          '\nЗатем имущество должника, кроме исключений, выставляется на торги. Деньги от его продажи идут на погашение долга. В первую очередь на продажу идут предметы роскоши, драгоценности и личный транспорт.'
          '\nНе могут быть изъяты:',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        BulletedItem(
          child: Text(
            'Единственная недвижимость или земельный участок должника',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Одежда и обувь суммой до 30 000 рублей, предметы личной гигиены',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Некоторая мебель и предметы обихода',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Домашние животные, если они не используются для предпринимательства, хозяйственные постройки для их обслуживания',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Профессиональное оборудование стоимостью до 100 минимальных размеров оплаты труда',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Продукты питания, топливо для отопления и приготовления пищи',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Транспорт и медицинская техника, если должник является инвалидом',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Призы и награды',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'После полной выплаты долга гражданин получает статус банкрота на пять лет. В течение этого времени он не может занимать управляющие должности и открывать счета в банке. Также он должен отчитываться обо всех совершенных сделках. Иногда банкрот также получает ограничения на выезд за границу.'
          '\nИтак, по закону вы имеете право не выплачивать займы только в двух ситуациях:',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        BulletedItem(
          child: Text(
            'Если займ достался вам по наследству. В таком случае вы должны отказаться от своей доли - иначе долги перейдут к вам вместе с остальным наследством',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Если вы объявили о банкротстве. В этом случае долги будут погашены за счет вашего имущества, а на вас будут наложены некоторые ограничения',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'Во всех остальных ситуациях вы будете обязаны погашать любые свои долги, независимо от обстоятельств.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
