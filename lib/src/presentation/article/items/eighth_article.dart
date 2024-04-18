import 'package:flutter/material.dart';

class EighthArticleItem extends StatelessWidget {
  const EighthArticleItem({super.key});

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
                "assets/images/main/ic_eighth.png",
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
            "Мифы о неуплате по займам",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'На форумах должников и в соцсетях часто преподносят некоторые утверждения как истину. На самом деле это только мифы.',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Миф 1.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: ' Долг будут выбивать с помощью физического насилия.'
                  '\nНа самом деле такие методы «общения» с должником противозаконны. Сейчас ЦБ и государство '
                  'активно регулируют взыскание, был принят закон о коллекторской деятельности. Однако, здесь '
                  'речь идет о долге перед лицензированной кредитной организацией. Черные кредиторы и частные '
                  'лица могут использовать выходящие за рамки закона методы воздействия',
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
              text: 'Миф 2.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text:
                  ' За неуплату долга грозит условное или реальное лишение свободы.'
                  '\nДелами о долгах занимается гражданское судопроизводство, а не уголовное, поэтому о лишении свободы речи не идет',
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
              text: 'Миф 3.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: ' Должника могут лишить родительских прав.'
                  '\nТо, что заемщик не выплатил долг кредитной организации, никак не характеризует '
                  'его как родителя. Поэтому долг по займам или кредитам не может служить основанием '
                  'для обращения в органы опеки',
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
              text: 'Миф 4.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: ' Имущество должника заберут и продадут на торгах.'
                  '\nЭто возможно только в случае, когда это имущество выступало в качестве залога по кредиту, '
                  'либо при соответствующем решении суда. Во всех остальных случаях отбирать имущество не имеют права',
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
              text: 'Миф 5.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: ' Родственников заставят платить по долгам заемщика.'
                  '\nЭто возможно только в двух случаях. Первый — когда эти родственники выступали '
                  'поручителями или созаемщиками по кредиту. Второй — когда заемщик умер, а родственники '
                  'вступили в права наследства и унаследовали долги члена семьи',
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
