import 'package:flutter/material.dart';

class SeventhArticleItem extends StatelessWidget {
  const SeventhArticleItem({super.key});

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
                "assets/images/main/ic_seventh.png",
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
            "Советы от юриста",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Опытные юристы, которые работают с задолженностями, советуют должникам:',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 1.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Обратитесь к грамотному юристу, который занимается вопросом задолженностей по займам. '
                  'Он внимательно изучит договор на предмет нарушений. '
                  'Если он их найдет, заемщик сможет обратиться в суд, признать договор '
                  'ничтожным и отказаться выплачивать долг',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 2.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Убедитесь, что займ был предоставлен правомерно, то есть дееспособному, '
                  'совершеннолетнему и здоровому человеку. Если это не так, то опекун может подать в суд на МФО',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 3.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Попробуйте договориться с МФО о реструктуризации долга. Многие из них предлагают '
                  'должникам варианты решения проблемы. Например, они могут заморозить проценты, а сумму '
                  'долга разбить на несколько частей с платежом раз в месяц. '
                  'Если с МФО договориться не получилось, обратитесь в другие кредитные организации с заявкой '
                  'на рефинансирование',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 4.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Инициируйте процедуру банкротства. Это актуально в тех случаях, когда долгов много и погасить '
                  'их все невозможно. Нужно учитывать, что процедура весьма затратная, а признать человека '
                  'банкротом может только суд. При этом, если банкротство состоится, нужно быть готовым к '
                  'тому, что все ликвидное имущество реализуют для погашения хотя бы части долгов, а на '
                  'вас наложат ограничения.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 5.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Если предстоит суд - не пожалейте денег на адвоката. Он внимательно изучит документы и '
                  'все обстоятельства, благодаря чему в суде будет легче отстоять свою позицию и снизить '
                  'размер долга.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Совет 6.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' Не обращайтесь к «антиколлекторам» и «раздолжнителям», которые обещают гарантированное избавление '
                  'от долгов. В лучшем случае вы получите от них стандартный набор рекомендаций и документов. '
                  'В худшем из-за их действий вы окончательно испортите отношения с МФО.',
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
