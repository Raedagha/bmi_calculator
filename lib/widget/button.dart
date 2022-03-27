import 'package:flutter/material.dart';

import '../constant.dart';

ButtonStyle style = ElevatedButton.styleFrom(
  primary: Colors.black,
);

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({
    required this.list,
    Key? key,
    this.onPressed,
    this.color = kActiveCardColour,
  }) : super(key: key);
  final List<Widget> list;
  final onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          onPressed: onPressed,
          child: Container(
            color: color,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: list),
          ),
        ),
      ),
    );
  }
}
