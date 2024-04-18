import 'package:flutter/material.dart';

import '../../custom/bulleted_item.dart';

class ThirdArticleItem extends StatelessWidget {
  const ThirdArticleItem({super.key});

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
                "assets/images/main/ic_third.png",
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
            "Когда МФО нарушают закон",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Иногда возникают ситуации, в которых МФО нарушают закон:',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Начисляет проценты или штрафы в большем размере, чем оговорено в законе',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Выдает займы, не имея на это соответствующей лицензии и записи в госреестре',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Продолжает требование вернуть долг даже в том случае, когда он передан коллекторам или дело отправлено в суд',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Изменяет условия начального договора в худшую для заемщика сторону',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Выдает займ недееспособному лицу',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Вводит в заблуждение, например, когда менеджер сообщает, что оформление страховки обязательно или это влияет на рассмотрение',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Выдает займ лицу, которому нет 18 лет',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        BulletedItem(
          child: Text(
            'Служба взыскания МФО звонит должнику в ночное время, портит его имущество, преследует, угрожает ему и членам его семьи',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'В любой из перечисленных ситуаций нужно обратиться с жалобой в полицию, СРО, Роспотребнадзор, прокуратуру, службу финансового омбудсмена или Центробанк.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
