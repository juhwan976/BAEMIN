import 'dart:core';

class Store {
  int uniqueNum;        /// 가게 고유 번호
  int category;         /// 가게 분
  String name;          /// 가게 이름
  double star;          /// 가게 별점
  int reviewNum;        /// 리뷰 수
  String description;   /// 대표 메뉴
  int minPrice;         /// 최소 주문 금액
  bool canTakeOut;      /// 포장 배너 표시 여부
  bool canPickUp;       /// 매장 배너 표시 여부
  bool showClean;       /// 위생정보 배너 표시 여부류
}