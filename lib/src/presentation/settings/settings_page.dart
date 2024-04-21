import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Настройки",
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Card(
                color: const Color(0xFFF1F1F1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "Политика Конфиденциальности\nи Условия Использования",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: SvgPicture.asset(
                            "assets/images/main/ic_arrow_right.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Card(
                color: const Color(0xFFF1F1F1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "Настройка\nуведомлений",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: SvgPicture.asset(
                            "assets/images/main/ic_arrow_right.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: GestureDetector(
                onTap: () => AutoRouter.of(context).pushNamed("/sub-page"),
                child: Card(
                  elevation: 0,
                  color: const Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              "Управление\nподпиской",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SvgPicture.asset(
                              "assets/images/main/ic_arrow_right.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
