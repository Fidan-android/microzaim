import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/first_page.dart';
import 'pages/second_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: [
          FirstPage(
            nextStep: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          SecondPage(
            onCloseWelcomePage: () {
              AutoRouter.of(context).replaceNamed("/home-page");
            },
          ),
        ][_currentIndex],
      ),
    );
  }
}
