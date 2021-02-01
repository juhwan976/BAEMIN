import 'dart:async';

import 'package:flutter/material.dart';

class MyBaeMinButton extends StatefulWidget {
  const MyBaeMinButton({
    Key key,
    @required this.child,
    @required this.function,
  }) : super(key: key);

  final Widget child;
  final Function function;

  _MyBaeMinButtonState createState() => _MyBaeMinButtonState();
}

class _MyBaeMinButtonState extends State<MyBaeMinButton> {
  StreamController<Color> _colorController = new StreamController();

  @override
  dispose() {
    super.dispose();

    _colorController.close();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: StreamBuilder(
        stream: _colorController.stream,
        initialData: Colors.white,
        builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
          return Container(
            color: snapshot.data,
            child: widget.child,
          );
        }
      ),
      onTap: widget.function,
      onTapUp: (onClick) {
        _colorController.add(Colors.white);
      },
      onTapDown: (onClick) {
        //_color = Color(0x0D000000);
        _colorController.add(Color(0x0D000000));
      },
      onTapCancel: () {
        //_color = Colors.white;
        _colorController.add(Colors.white);
      }
    );
  }
}
