import 'dart:core';

class Store {
  /// 고유 번호
  int uniqueNum;

  /// 카테고리 번호
  int category;

  /// 가게 이름
  String name;

  /// 별점
  double star;

  /// 리뷰 수
  int reviewNum;

  /// 설명
  String description;

  /// 최소 주문 금액
  String minPrice;

  /// 쿠폰
  bool canCoupon = false;

  /// 포장 가능
  bool canTakeOut = false;

  /// 방문 가능
  bool canPickUp = false;

  /// 위생정보 표시 여부
  bool showClean = false;

  Store({
    int uniqueNum,
    int category,
    String name,
    double star,
    int reviewNum,
    String description,
    String minPrice,
    bool canCoupon,
    bool canTakeOut,
    bool canPickUp,
    bool showClean,
  }) {
    this.uniqueNum = uniqueNum;
    this.category = category;
    this.name = name;
    this.star = star;
    this.reviewNum = reviewNum;
    this.description = description;
    this.minPrice = minPrice;
    this.canCoupon = canCoupon;
    this.canTakeOut = canTakeOut;
    this.canPickUp = canPickUp;
    this.showClean = showClean;
  }
}
