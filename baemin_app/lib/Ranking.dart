import 'package:flutter/material.dart';

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
    @required this.name,
    @required this.info,
  });
}
