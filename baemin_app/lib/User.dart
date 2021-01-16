class User {
  String name;        /// 사용자 아이디
  String phoneNum;    /// 사용자 휴대폰 번호
  int grade;          /// vip 등급

  User({String name, String phoneNum, int grade}) {
    this.name = name;
    this.phoneNum = phoneNum;
    this.grade = grade;
  }
}