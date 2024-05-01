import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microzaim/src/domain/state/calendar/calendar_state.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarState _calendarState = CalendarState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/calendar/ic_delete.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0x26000000), BlendMode.srcIn),
                ),
                Text(
                  "Календарь",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context).pushNamed("/import-page"),
                  child: SvgPicture.asset(
                    "assets/images/calendar/ic_download.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0xD90F3F15), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/calendar/ic_left_arrow.svg",
                      colorFilter: const ColorFilter.mode(
                          Color(0xD9000000), BlendMode.srcIn),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Март 2024",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/calendar/ic_forward_arrow.svg",
                      colorFilter: const ColorFilter.mode(
                          Color(0xD9000000), BlendMode.srcIn),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Остаток",
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    Text(
                      "10 000",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Observer(
                builder: (_) {
                  if (_calendarState.list.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/calendar/ic_download.svg",
                          width: 28,
                          height: 32,
                          colorFilter: const ColorFilter.mode(
                              Color(0xD90F3F15), BlendMode.srcIn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Чтобы воспользоваться календарем, импортруйте данные из расчетов",
                            style:
                                Theme.of(context).primaryTextTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
