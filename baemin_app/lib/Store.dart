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

  /// 소요시간
  String minDuration;
  String maxDuration;

  /// 최소 주문 금액
  String minPrice;

  /// 배달팁
  String minDeliverTip;
  String maxDeliverTip;

  /// 쿠폰
  bool canCoupon = false;

  /// 포장 가능
  bool canTakeOut = false;

  /// 방문 가능
  bool canPickUp = false;

  /// 위생정보 표시 여부
  bool showClean = false;

  /// 배달 가능 여부
  bool canDelivery = false;

  Store({
    int uniqueNum,
    int category,
    String name,
    double star,
    int reviewNum,
    String description,
    String minDuration,
    String maxDuration,
    String minPrice,
    String minDeliverTip,
    String maxDeliverTip,
    bool canCoupon,
    bool canTakeOut,
    bool canPickUp,
    bool showClean,
    bool canDelivery,
  }) {
    this.uniqueNum = uniqueNum;
    this.category = category;
    this.name = name;
    this.star = star;
    this.reviewNum = reviewNum;
    this.description = description;
    this.minDuration = minDuration;
    this.maxDuration = maxDuration;
    this.minPrice = minPrice;
    this.minDeliverTip = minDeliverTip;
    this.maxDeliverTip = maxDeliverTip;
    this.canCoupon = canCoupon;
    this.canTakeOut = canTakeOut;
    this.canPickUp = canPickUp;
    this.showClean = showClean;
    this.canDelivery = canDelivery;
  }
}
