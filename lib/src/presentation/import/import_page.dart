import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:microzaim/src/config/app_route.gr.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({super.key});

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> with TickerProviderStateMixin {
  late TabController _calculationsTabController;

  @override
  void initState() {
    _calculationsTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InternalPageTemplate(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
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
                    Center(
                      child: Text(
                        "Импорт",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: TabBarView(
                    controller: _calculationsTabController,
                    children: [
                      Column(
                        children: [
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box<LoanModel>("import_loan").listenable(),
                            builder: (context, Box<LoanModel> box, _) {
                              if (box.values.isEmpty) {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      "Вы еще не добавляли расчеты в календарь",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: box.values.length,
                                    itemBuilder: (context, index) {
                                      LoanModel model = box.getAt(index)!;
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F1F1),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      model.lender,
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Итого к возврату: ${model.totalToRefunded}",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color: const Color(
                                                                  0xB30F3F15),
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Переплата: ${model.overpayment}",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color: const Color(
                                                                  0xB30F3F15),
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                    "assets/images/main/ic_arrow_right.svg"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box<DebtModel>("import_debt").listenable(),
                            builder: (context, Box<DebtModel> box, _) {
                              if (box.values.isEmpty) {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      "Вы еще не добавляли расчеты в календарь",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: box.values.length,
                                    itemBuilder: (context, index) {
                                      DebtModel model = box.getAt(index)!;
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F1F1),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Расчет ${index + 1}",
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Платеж/мес: ${model.monthlyIncome}",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color: const Color(
                                                                  0xB30F3F15),
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Долговая нагрузка: ${model.debtBurden}%",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color: const Color(
                                                                  0xB30F3F15),
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                    "assets/images/main/ic_arrow_right.svg"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    color: const Color(0xFFF8FEFB),
                    border: Border.all(
                      color: const Color(0xFFB3B3B3),
                    ),
                  ),
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    controller: _calculationsTabController,
                    splashFactory: NoSplash.splashFactory,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(54),
                      color: const Color(0xFF1C5337),
                    ),
                    labelStyle:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                    unselectedLabelStyle:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF0F3F15),
                              fontSize: 15,
                            ),
                    tabs: const [
                      Tab(
                        text: "Расчет займа",
                      ),
                      Tab(
                        text: "Долговая нагрузка",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
