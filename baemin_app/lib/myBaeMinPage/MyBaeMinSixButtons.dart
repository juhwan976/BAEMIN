import 'package:baemin_app/myBaeMinPage/MyBaeMinButton.dart';
import 'package:flutter/material.dart';

///*****************************************************************************
///
/// my배민 페이지 중간 정도에 나오는 6개 버튼에서 하나의 버튼을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   String    directory   : 아이콘에 사용될 이미지의 위치
/// @required   String    text        : 버튼에 표시될 제목
/// @required   Function  function    : 버튼을 눌렀을 때 실행될 함수
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [text]의 [fontSize]는 12로 되어있다.
///
///*****************************************************************************
///
class MyBaeMinSixButtons extends StatelessWidget {
  const MyBaeMinSixButtons({
    Key? key,
    required this.directory,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String directory;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {

    return MyBaeMinButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            child: Image.asset(directory),
          ),
          Text(
            text,
            textScaleFactor: 0.82,
            style: TextStyle(
              fontSize: 12,
              color: Color(0x70000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      function: function,
    );
  }
}
