import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FifthArticleItem extends StatelessWidget {
  const FifthArticleItem({super.key});

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
                "assets/images/main/ic_fifth.png",
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
            "Что делать с унаследованным займом",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'В случае смерти заемщика все его долги переходят к его наследникам. Это касается как банковских кредитов, '
            'так и микрозаймов. Если наследников несколько, то сумма всех долгов делится между ними в зависимости от доли наследства.'
            '\nВсе соглашения по наследствам вступают в силу через шесть месяцев после смерти наследодателя. С этого '
            'времени также следует выплачивать долг по унаследованным займам. Но все это время продолжают '
            'начисляться проценты и штрафы за просрочку. Чтобы этого избежать, сразу же после получения свидетельства о '
            'смерти обратитесь в организацию, которая выдала займ, и сообщите о смерти заемщика.'
            '\nВы должны выплачивать только непогашенную часть долга. Ни одна организация не имеет права требовать выплаты всей суммы займа.'
            '\nЕдинственный способ не выплачивать займы умершего наследодателя — отказаться от наследства. Для этого нужно '
            'написать заявление об отказе и заверить его у нотариуса. Отказ от наследства имеет смысл, если '
            'размер оставленного имущества меньше размера долга.'
            '',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text:
                  'Порядок наследования долга и последующей уплаты определяет ',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'статья 1175',
              style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse(
                      "https://base.garant.ru/10164072/a78bd6dd46fb5e2be08c33ac50a26487/"));
                },
            ),
            TextSpan(
              text: ' Гражданского кодекса РФ.',
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
