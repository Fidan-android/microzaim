import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';

class ArticleForKazakhstanPage extends StatelessWidget {
  const ArticleForKazakhstanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InternalPageTemplate(
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 12),
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
                              "🇰🇿",
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
                    "Сводка по законодательству Казахстана о микрокредитах, микрозаймах и займах онлайн",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
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
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Text(
                    '1. Закон Республики Казахстан "О микрофинансовой деятельности" от 19 мая 2009 года № 153-IV.'
                    '\n- Определяет правовые, экономические и организационные основы микрофинансовой деятельности, регулирует отношения в сфере предоставления микрокредитов.'
                    '\n\n2. Закон Республики Казахстан "О банках и банковской деятельности в Республике Казахстан" от 31 августа 1995 года № 2444.'
                    '\n- Устанавливает основные требования к банковской деятельности, включая деятельность, связанную с предоставлением займов.'
                    '\n\n3. Постановления и нормативные акты Агентства Республики Казахстан по регулированию и развитию финансового рынка.'
                    '\n- Определяют более детальные требования к деятельности микрофинансовых организаций, включая лицензирование, '
                    'стандарты предоставления микрокредитов и защиту прав потребителей.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400, wordSpacing: 12),
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
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Text(
                    '- Лицензирование: Для осуществления микрофинансовой деятельности организации должны '
                    'получить соответствующую лицензию от Агентства по регулированию и развитию финансового рынка.'
                    '\n- Процентные ставки: В Казахстане действуют ограничения на максимальные процентные ставки'
                    ' по микрокредитам для защиты прав потребителей.'
                    '\n- Требования к договору: Договор микрокредита должен четко фиксировать все условия предоставления'
                    ' займа, включая сумму, проценты, сроки и порядок возврата.'
                    '\n- Защита прав потребителей: Заемщики имеют право на получение полной и понятной информации о '
                    'условиях микрокредита, включая все возможные комиссии и платежи.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400, wordSpacing: 12),
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
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Text(
                    '- Своевременный возврат займа:  Заемщики обязаны возвращать заемные средства и '
                    'уплачивать проценты в соответствии с условиями договора.'
                    '\n- Предоставление достоверной информации: При обращении за займом необходимо '
                    'предоставлять точные и полные сведения о своих финансовых обстоятельствах.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400, wordSpacing: 12),
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
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Text(
                    '1. Внимательно ознакомьтесь с условиями договора перед подписанием, особенно с размером процентной ставки и полной стоимостью кредита.'
                    '\n2. Изучите рынок предложений от разных микрофинансовых организаций, чтобы выбрать наиболее выгодные условия.'
                    '\n3. Помните о рисках: Микрокредитование связано с высокими процентными ставками и комиссиями, поэтому'
                    ' важно рассматривать его как краткосрочное решение финансовых вопросов.',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400, wordSpacing: 12),
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
