import 'package:flutter/material.dart';

class BulletedItem extends StatelessWidget {
  const BulletedItem({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              String.fromCharCode(0x2022),
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
