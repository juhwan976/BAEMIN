///*****************************************************************************
///
/// my배민 페이지에서 사용하려고 만든 클래스
///
///*****************************************************************************
///
class User {
  /// 사용자 아이디
  String name;

  /// 사용자 휴대폰 번호
  String phoneNum;

  /// vip 등급
  int grade;

  User({
    String name,
    String phoneNum,
    int grade,
  }) {
    this.name = name;
    this.phoneNum = phoneNum;
    this.grade = grade;
  }
}
