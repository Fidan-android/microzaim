import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SixthArticleItem extends StatelessWidget {
  const SixthArticleItem({super.key});

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
                "assets/images/main/ic_sixth.png",
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
            "Истечение срока давности",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    'По требованиям кредиторов действует общий срок исковой давности, который составляет '
                    '3 года с момента просрочки платежа по займу (см. ',
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: 'ст. 196 ГК РФ',
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        "https://legalacts.ru/kodeks/GK-RF-chast-1/razdel-i/podrazdel-5/glava-12/statja-196/"));
                  },
              ),
              TextSpan(
                text: ').',
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              )
            ]),
          ),
        ),
        Text(
          'Отсчет срока начинается после предъявления клиенту требования о возврате задолженности '
          '(если иное не предусмотрено условиями договора потребительского займа). ',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Финорганизация также вправе передать долг коллекторскому агентству '
                    'через 90 суток с момента образования долга. Но при этом, в силу ',
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: 'ст. 201 ГК РФ',
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        "https://legalacts.ru/kodeks/GK-RF-chast-1/razdel-i/podrazdel-5/glava-12/statja-201/"));
                  },
              ),
              TextSpan(
                text:
                    ', заключение договора цессии не приведет к изменению срока исковой давности. '
                    'Просто МФО лишится права по взысканию задолженности — оно перейдет к коллекторам.',
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Text(
          'Помните про то, что невыплата микрозайма может повлечь за собой административную и '
          'даже уголовную ответственность. Имущество может изыматься и выставляться на продажу '
          'только по решению суда. Рекомендуем в любом случае при наличии существенной задолженности '
          'обратиться за помощью к юристу, ведь все ситуации индивидуальны.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
