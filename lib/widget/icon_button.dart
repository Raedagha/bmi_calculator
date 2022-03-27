import 'package:flutter/material.dart';

import '../constant.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({Key? key, required this.text, required this.iconData})
      : super(key: key);
  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 100,
            color: Colors.white,
          ),
          Text(text, textAlign: TextAlign.center, style: kBodyTextStyle),
        ],
      ),
    );
  }
}
