import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  const BankView({Key? key, required this.onContinue}) : super(key: key);

  final void Function() onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
            width: 280,
            height: 280,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/welcome/ic_bank.png"),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            "Мы не являемся кредитной организацией",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: "SFProText",
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Мы не осуществляем выдачу займов или кредитов пользователям нашего приложения",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: "SFProText"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: onContinue,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xFFBCFE2B),
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
        )
      ],
    );
  }
}
