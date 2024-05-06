import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microzaim/src/domain/state/home/home_state.dart';
import 'package:microzaim/src/presentation/custom/bottom_nav_bar.dart';
import 'package:microzaim/src/presentation/settings/settings_page.dart';
import 'package:provider/provider.dart';

import 'calculators/calculators_page.dart';
import 'calendar/calendar_page.dart';
import 'main/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeState _homeState;

  @override
  void didChangeDependencies() {
    _homeState = Provider.of<HomeState>(context, listen: false);
    super.didChangeDependencies();
  }

  /*@override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainRoute(),
        CalculatorsRoute(),
        CalendarRoute(),
        SettingsRoute(),
      ],
      homeIndex: 0,
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: tabsRouter.setActiveIndex,
        currentIndex: tabsRouter.activeIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/ic_home.svg",
                height: 25, width: 25),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_home.svg",
              height: 25,
              width: 25,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF1C5337), BlendMode.srcIn),
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/ic_calculator.svg",
                height: 25, width: 25),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_calculator.svg",
              height: 25,
              width: 25,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF1C5337), BlendMode.srcIn),
            ),
            label: 'Калькуляторы',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/ic_calendar.svg",
                height: 25, width: 25),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_calendar.svg",
              height: 25,
              width: 25,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF1C5337), BlendMode.srcIn),
            ),
            label: 'Календарь',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/ic_settings.svg",
                height: 25, width: 25),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_settings.svg",
              height: 25,
              width: 25,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF1C5337), BlendMode.srcIn),
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Expanded(
                  child: [
                    const MainPage(),
                    const CalculatorsPage(),
                    const CalendarPage(),
                    const SettingsPage()
                  ][_homeState.currentIndex],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
