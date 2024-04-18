import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microzaim/src/domain/state/init/init_state.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  late InitState _initState;
  late List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    _initState = Provider.of<InitState>(context, listen: false);
    _disposers = [
      reaction((_) => _initState.isFirstLaunch, (bool? isFirstLaunch) {
        if (isFirstLaunch == true) {
          AutoRouter.of(context).replaceNamed("/welcome-page");
        } else if (isFirstLaunch == false) {
          AutoRouter.of(context).replaceNamed("/home-page");
        }
      })
    ];
    Future.delayed(const Duration(seconds: 2), () async {
      await _initState.checkingTheFirstLaunch();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
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
