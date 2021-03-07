import 'dart:async';

import 'package:flutter/material.dart';

///*****************************************************************************
///
/// my배민 페이지에서 사용되는 버튼을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   Widget    child     : [GestureDetector] 의 [child] 로 사용될 [Widget]
/// @required   Function  function  : [onTap] 가 발생했을 때 실행될 함수
///
/// [GestureDetector] 의 [Tap] 관련 속성들 중
/// [onTap], [onTapUp], [onTapDown], [onTapCancel] 만 사용되었다.
///
/// @ 메서드
/// void      dispose()
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
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
