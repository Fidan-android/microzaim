import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorsPage extends StatefulWidget {
  const CalculatorsPage({super.key});

  @override
  State<CalculatorsPage> createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
                      onTap: () {},
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
                Text("second"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
