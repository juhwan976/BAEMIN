import 'dart:io';

import 'package:flutter/material.dart';

///*****************************************************************************
///
/// main.dart 에서 네비게이션에 표시될 아이콘을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   int       selectedIndex : 현재 네비게이션에서 선택된 index
/// @required   int       compareIndex : 아이콘이 표시될 위치의 index
/// @required   String    normalIcon : 선택되지 않았을 경우 표시될 아이콘 이미지의 위치
/// @required   String    selectedIcon : 선택되었을 경우 표시될 아이콘 이미지의 위치
/// @required   String    title : 아이콘과 함께 표시될 이름
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
class NavigationIcon extends StatelessWidget {
  const NavigationIcon({
    Key? key,
    required int selectedIndex,
    required this.compareIndex,
    required this.normalIcon,
    required this.selectedIcon,
    required this.title,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;
  final int compareIndex;
  final String normalIcon;
  final String selectedIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          (_selectedIndex == compareIndex) ? selectedIcon : normalIcon,
          height: 30,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, (Platform.isIOS) ? 5 : 0, 0, 0), // 5
          child: Text(
            title,
            textScaleFactor: 0.82,
            style: TextStyle(
              color: (_selectedIndex == compareIndex)
                  ? Color.fromARGB(255, 38, 193, 188)
                  : Color.fromARGB(255, 136, 136, 136),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
