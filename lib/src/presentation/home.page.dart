import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microzaim/src/domain/state/home/home_state.dart';
import 'package:microzaim/src/presentation/calculators/calculators_page.dart';
import 'package:microzaim/src/presentation/calendar/calendar_page.dart';
import 'package:microzaim/src/presentation/main/main_page.dart';
import 'package:microzaim/src/presentation/settings/settings_page.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
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
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (_homeState.currentIndex != index) {
              _homeState.changeIndex(index);
            }
          },
          currentIndex: _homeState.currentIndex,
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
      ),
    );
  }
}
