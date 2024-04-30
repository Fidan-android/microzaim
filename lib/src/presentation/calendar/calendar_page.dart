import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
                SvgPicture.asset(
                  "assets/images/calendar/ic_download.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xD90F3F15), BlendMode.srcIn),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
