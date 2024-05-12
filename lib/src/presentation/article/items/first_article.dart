import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../custom/bulleted_item.dart';

class FirstArticleItem extends StatelessWidget {
  const FirstArticleItem({super.key});

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
                "assets/images/main/ic_first.png",
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
            "Можно ли не платить микрозайм законно",
            style: Theme.of(context)
                .primaryTextTheme
                .titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Если клиeнт попал в трудную финансовую ситуацию, то проценты по займу и штрафы за просрочку по взятым кредитам только усугубляют '
            'его и без того сложное положение. К счастью, в определенных ситуациях можно законно реструктуризировать долг, снизить проценты '
            'и не платить начисленные пени и штрафы за просрочку текущих платежей.'
            '\nВернуть сумму зaйма МФО придется в любом случае. Исключение — банкротство физического лица. Но через суд можно официально уменьшить '
            'или списать штрафы, а в отдельных ситуациях — и основные проценты по займу.'
            '\nСписание задолженности (как полное, так и частичное) возможно в нескольких случаях:',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Нарушение закона со стороны микрофинансовой организации — отсутствие сведений'
            ' в государственном реестре МФО ЦБ РФ, получение уведомлений о необходимости возврата '
            'долга после передачи права требования коллекторам, изменение существенных условий сделки '
            'в одностороннем порядке, отсутствие процентов на первой странице договора потребительского займа',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Законная отсрочка (кредитные каникулы) — можно попытаться договориться о моратории, согласовать новый'
            ' график выплат займа микрофинансирования и снизить первоначальную процентную ставку (провести реструктуризацию).'
            ' В этом случае нужно предоставить кредитору документы, подтверждающие ухудшение финансового положения заемщика',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Покупка долга у МФО или коллекторского aгентства в рамках договора сессии — выкуп могут осуществлять физлица '
            '(в том числе родственники должника) или юрлица (объединения юристов). Здесь нужно найти компромисс и добиться, '
            'чтобы долг был списан за символическую плату',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Объявление физического лица банкротом через суд — если задолженность '
            'по оформленным кредитам и займам превысила 500 000 рублей, '
            'а просрочка по обязательствам составила более 90 дней',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'В последнем случае придется оплатить вознаграждение финансовому управляющему – от 25 000 рублей, а также госпошлину за подачу документов в суд.'
          '\nПоследствия банкротства следующие: ',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        BulletedItem(
          child: Text(
            'Гражданин не сможет участвовать в управлении юридическим лицом в течение 3 лет после признания его банкротом',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Ему придется в течение 5 лет уведомлять финорганизации о том, что ранее клиент был признан банкротом',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Во время судебного разбирательства физлицо не сможет выезжать за границу',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'В течение 5 лет гражданин не имеет права повторно возбуждать дело о банкротстве',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Гражданин не сможет занимать должности в органах управления кредитной организации в течение 10 последующих лет',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'Таким образом, банкротство — это не приговор, но получить кредит или займ в течение 5 лет будет затруднительно.'
          '\nИмейте в виду, что с 1 июля 2023 года проценты, неустойки и иные начисления по договорам займа, заключенным сроком до 1 года, '
          'не могут превышать сумму основного долга более чем в 1,3 раза.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text:
                  'Данное условие также должно быть отражено на первой странице договора перед таблицей с индивидуальными условиями потребительского займа (см. ',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'п.24 ст. 5 ФЗ №353 ',
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(
                      Uri.parse("https://docs.cntd.ru/document/499065397"));
                },
            ),
            TextSpan(
              text:
                  'от 21.12.2013 года). После достижения этого размера начисление процентов и других платежей должно быть прекращено.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
      ],
    );
  }
}
