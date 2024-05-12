import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key, required this.onContinue}) : super(key: key);

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
                child: Image.asset("assets/images/welcome/ic_book.png"),
              ),
            ),
          ),
        ),
        const Text(
          "Мы предоставляем информацию по сфере микрофинансов",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: "SFProText",
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            "В нашем приложении вы можете\nнайти информационный блок по\nсфере микрофинансов в России и\nКазахстане",
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
        ),
      ],
    );
  }
}
