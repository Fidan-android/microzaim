import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBCFE2B),
      body: SafeArea(
        child: Center(child: SvgPicture.asset("assets/images/app_logo.svg")),
      ),
    );
  }
}
