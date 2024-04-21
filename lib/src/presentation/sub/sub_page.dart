import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFBCFE2B).withAlpha(50),
                      blurRadius: 80.0,
                      spreadRadius: 40.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        onTap: () => AutoRouter.of(context).pop(),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0x4D3E3E3E)),
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/images/app_logo_gray.svg"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Как работает\nваша подписка",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 36,
                              color: const Color(0x993E3E3E),
                              fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x99FB374C),
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/ic_plus.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              height: 58,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: const Color(0x1A3E3E3E),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x993E88FF),
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/ic_calendar.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Расчет займов",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        "Расчитывайте выплаты ваших займов",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox.fromSize(
                                size: Size(0, 38),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Календарь выплат",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        "Записывайте все ваши займы",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                      (states) => const Color(0xFFBCFE2B),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(43),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "\$0.99/в месяц",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Восстановить покупку",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0x993E3E3E),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
