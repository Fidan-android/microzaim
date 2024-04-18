import 'package:flutter/material.dart';

class SecondArticleItem extends StatelessWidget {
  const SecondArticleItem({super.key});

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
                "assets/images/main/ic_second.png",
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
            "Что будет, если не платить микрозайм",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Процедура взыскания задолженности проходит в несколько этапов:',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Этап 1. Внутреннее взыскание',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          'Этот этап — начало работы с задолженностью. Он начинается еще при небольших просрочках. '
          'Здесь заемщику начинают звонить сотрудники МФО и напоминать о долге, а также отправлять '
          'SMS. Если у клиента произошла непредвиденная ситуация - например, он потерял работу - сотрудники '
          'микрофинансовой организации предлагают оплатить проценты и продлить договор или принять участие в '
          'программе реструктуризации. По закону звонить могут не более одного раза в день, с 8 утра до 10 '
          'вечера в будние дни и с 9 утра до 8 вечера по выходным. Кроме того, МФО не имеет права звонить по '
          'контактным номерам и на работу.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Этап 2. Передача долга коллекторам',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          'Если просрочка по займу превышает 90 дней, а должник за это время не внес ни одного платежа и при '
          'этом он не идет на контакт, МФО передает долг коллекторам. Несмотря на то, что коллекторская '
          'деятельность тоже регулируется законом, здесь уже не обойдется одними звонками и SMS. Коллекторы '
          'имеют право прийти домой и на работу, но не чаще одного раза в неделю. Звонить можно дважды в '
          'неделю. Общаться с должником должны вежливо, не должно быть никаких угроз. Кроме того, коллекторы '
          'не имеют права препятствовать ведению должником аудио и видеозаписи.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Этап 3. Перепродажа долга',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          'Если предпринятые ранее меры не помогли, долг продают другой финансовой организации или коллекторскому '
          'агентству. В вопросе коммуникаций для должника особо никаких изменений не будет. Кроме того, что '
          'ему могут предложить реструктуризацию или другие индивидуальные условия. При этом должнику надо '
          'помнить, что общая сумма, которую с него могут требовать, не должна превышать основную сумму долга '
          'более чем в 1,5 раза, вместе со штрафами и пени, независимо от срока просрочки.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Этап 4. Судебное взыскание',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          'Обычно с момента просрочки до начала судебного разбирательства проходит около полугода. Истец передает '
          'в суд все данные, которые за это время удалось собрать по должнику, в том числе записи телефонных '
          'разговоров и тех, что были при личных встречах. При этом почти в 100% случаев суд удовлетворит иск '
          'и обяжет должника погасить не только задолженность по займу, но и оплатить судебные издержки. Если '
          'должник будет игнорировать решение суда, возвратом долга будут заниматься приставы. Это значит, что '
          'они могут изъять имущество, наложить арест на счета, запретить выезд за границу и ввести другие '
          'ограничения.',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
