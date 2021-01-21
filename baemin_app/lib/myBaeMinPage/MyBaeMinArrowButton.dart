import 'package:flutter/material.dart';

class MyBaeMinArrowButton extends StatelessWidget {
  const MyBaeMinArrowButton({Key key, @required this.child, @required this.function}) : super(key: key);

  final Widget child;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Color(0x0D000000),
      child: child,
      onPressed: function,
    );
  }
}