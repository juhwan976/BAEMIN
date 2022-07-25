import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 검색 페이지에서 사용하려고 만든 클래스
///
///*****************************************************************************
///
class Ranking {
  /// 항목 이름
  String name;

  /// 변동사항
  /// 0 -> new
  /// 1 -> up
  /// 2 -> down
  /// 3 -> keep
  int info;

  Ranking({
    required this.name,
    required this.info,
  });
}
