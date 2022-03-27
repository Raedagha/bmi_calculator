import 'package:flutter/material.dart';

import '../constant.dart';

class IconCircle extends StatelessWidget {
  const IconCircle({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kInactiveCardColour,
      textColor: Colors.white,
      child: Icon(
        iconData,
        size: 30,
      ),
      padding: const EdgeInsets.all(14),
      shape: const CircleBorder(),
    );
  }
}
