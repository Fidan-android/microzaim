import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.nextStep}) : super(key: key);

  final void Function() nextStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80),
            child: Text(
              "Добро\nПожаловать\nВ Займы Онлайн:\nАссистент*",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontFamily: "SFProText",
                  fontWeight: FontWeight.w500),
            ),
          ),
          SvgPicture.asset("assets/images/welcome/ic_lines.svg"),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "* Не является кредитной организацией",
                    style: TextStyle(fontSize: 14, fontFamily: "SFProText"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: nextStep,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFFBCFE2B),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(44),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Продолжить",
                          style: TextStyle(
                            fontFamily: 'SFProText',
                            color: Color(0xFF0F3F15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
