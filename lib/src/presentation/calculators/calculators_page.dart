import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:microzaim/src/config/app_route.gr.dart';
import 'package:microzaim/src/conventions/enum/calculations_type.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';

class CalculatorsPage extends StatefulWidget {
  const CalculatorsPage({super.key});

  @override
  State<CalculatorsPage> createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _calculationsTabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _calculationsTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              // Use the default focused overlay color
              return states.contains(MaterialState.focused)
                  ? null
                  : Colors.transparent;
            },
          ),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(54),
            color: const Color(0xFFBCFE2B),
          ),
          labelStyle: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0x4D0F3F15),
                  ),
          tabs: const [
            Tab(
              text: "Калькуляторы 🧮",
            ),
            Tab(
              text: "Расчеты 📁",
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          AutoRouter.of(context).pushNamed("/loan-page"),
                      child: Card(
                        elevation: 0,
                        color: const Color(0xFFF1F1F1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 0,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(23),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: Image.asset(
                                      "assets/images/calculator/ic_calc_loan.png"),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Калькулятор расчета займа",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Быстро рассчитать общую сумму погашения займа",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: SvgPicture.asset(
                                    "assets/images/main/ic_arrow_right.svg"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          AutoRouter.of(context).pushNamed("/debt-burden-page"),
                      child: Card(
                        elevation: 0,
                        color: const Color(0xFFF1F1F1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 0,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(23),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: Image.asset(
                                      "assets/images/calculator/ic_calc_burden.png"),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Калькулятор долговой нагрузки",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Быстро рассчитать процент долговой нагрузки",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: SvgPicture.asset(
                                    "assets/images/main/ic_arrow_right.svg"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _tabCalculationsLayout(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabCalculationsLayout() {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _calculationsTabController,
            children: [
              Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable:
                        Hive.box<LoanModel>("loan_box").listenable(),
                    builder: (context, Box<LoanModel> box, _) {
                      if (box.values.isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              "Вы еще не производили расчетов",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
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
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    CalculationsInfoRoute(
                                        calculationsType: CalculationsType.loan,
                                        title: model.lender,
                                        loanModel: model),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
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
                                                  const EdgeInsets.only(top: 8),
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
                        Hive.box<DebtModel>("debt_box").listenable(),
                    builder: (context, Box<DebtModel> box, _) {
                      if (box.values.isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              "Вы еще не производили расчетов",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
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
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    CalculationsInfoRoute(
                                        calculationsType:
                                            CalculationsType.debtBurden,
                                        title: "Расчет ${index + 1}",
                                        debtModel: model),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
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
                                                  const EdgeInsets.only(top: 8),
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
    );
  }
}
