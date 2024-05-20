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
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/welcome/ic_bank_2x.png"),
              ),
            ),
          ),
        ),
        Text(
          "Мы не являемся кредитной организацией",
          style: Theme.of(context)
              .primaryTextTheme
              .bodyLarge
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            "Мы не осуществляем выдачу займов\nили кредитов пользователям нашего приложения",
            style: Theme.of(context).primaryTextTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
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
        )
      ],
    );
  }
}
