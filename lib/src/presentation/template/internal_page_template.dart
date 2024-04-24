import 'package:flutter/material.dart';
import 'package:microzaim/src/presentation/custom/bottom_nav_bar.dart';

class InternalPageTemplate extends StatefulWidget {
  const InternalPageTemplate({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<InternalPageTemplate> createState() => _InternalPageTemplateState();
}

class _InternalPageTemplateState extends State<InternalPageTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
