import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microzaim/src/domain/state/home/home_state.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late HomeState _homeState;

  @override
  void didChangeDependencies() {
    _homeState = Provider.of<HomeState>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (_homeState.currentIndex != index) {
            if (AutoRouter.of(context).canPop()) {
              AutoRouter.of(context).pop();
            }
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
    );
  }
}
