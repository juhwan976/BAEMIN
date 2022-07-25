import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 찜한가게 페이지에서 쿠폰, 포장, 매장, 신규 등의 핀을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   bool      visible   : 핀을 보일것인지 판별하는 변수
/// @required   String    title     : 핀에 표시될 내용
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// 핀의 [fontSize] 는 12로 설정되었다.
///
///*****************************************************************************
///
class ZZimPin extends StatelessWidget {
  const ZZimPin({
    Key? key,
    required this.visible,
    required this.title,
  }) : super(key: key);

  final bool? visible;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: Container(
        margin: EdgeInsets.fromLTRB(3, 12, 0, 0),
        width: 30,
        height: 17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (title == '쿠폰')
              ? Colors.orange
              : ((title == '신규') ? Colors.red : Colors.black),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 0, 0),
            child: Text(
              title,
              textScaleFactor: 0.82,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
