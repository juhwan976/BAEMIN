class User {
  /// 사용자 아이디
  String name;

  /// 사용자 휴대폰 번호
  String phoneNum;

  /// vip 등급
  int grade;

  User({String name, String phoneNum, int grade}) {
    this.name = name;
    this.phoneNum = phoneNum;
    this.grade = grade;
  }
}