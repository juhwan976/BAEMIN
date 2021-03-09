import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../Store.dart';
import '../ZZimBuildPage.dart';

///*****************************************************************************
///
/// 찜한가게 페이지의 찜한가게 탭
///
///*****************************************************************************
///
class ZZimed extends StatelessWidget {
  const ZZimed({
    Key key,
    @required this.buildContext,
    @required this.scrollBehaviorSubject,
  }) : super(key: key);

  final BuildContext buildContext;
  final BehaviorSubject<bool> scrollBehaviorSubject;

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = [
      Store(
        name: '혼밥대왕 부산사직점',
        star: 4.9,
        reviewNum: 100,
        description: '제주흑돼지김치찌개 도시락, 우···',
        minDuration: '49',
        maxDuration: '64',
        minPrice: '6,900',
        minDeliverTip: '0',
        maxDeliverTip: '2,000',
        isNew: true,
        canCoupon: false,
        canTakeOut: true,
        canPickUp: false,
        showClean: false,
        canDelivery: true,
        isOpen: true,
      ),
      Store(
        name: '착한피자',
        star: 5.0,
        reviewNum: 100,
        description: '클래식고구마피자, 클래식콤비···',
        minDuration: '30',
        maxDuration: '30',
        minPrice: '14,900',
        minDeliverTip: '1,000',
        maxDeliverTip: '1,000',
        isNew: false,
        canCoupon: true,
        canTakeOut: true,
        canPickUp: true,
        showClean: false,
        canDelivery: false,
        isOpen: true,
      ),
      Store(
        name: '푸라닭 명륜점',
        star: 4.9,
        reviewNum: 100,
        description: '제네럴 핫 윙콤보, 블랙투움바',
        minDuration: '40',
        maxDuration: '55',
        minPrice: '15,900',
        minDeliverTip: '1,000',
        maxDeliverTip: '1,000',
        isNew: false,
        canCoupon: false,
        canTakeOut: true,
        canPickUp: false,
        showClean: false,
        canDelivery: true,
        isOpen: true,
      ),
      Store(
        name: '달랏 쌀국수',
        star: 4.9,
        reviewNum: 100,
        description: '달랏쌀국수+새우요리(2인), 달···',
        minDuration: '44',
        maxDuration: '59',
        minPrice: '7,000',
        minDeliverTip: '2,000',
        maxDeliverTip: '5,000',
        isNew: false,
        canCoupon: true,
        canTakeOut: false,
        canPickUp: false,
        showClean: false,
        canDelivery: false,
        isOpen: true,
      ),
      Store(
        name: '맘스터치 동래명륜점',
        star: 4.7,
        reviewNum: 100,
        description: '고기가득 리얼비프버거 세트, N···',
        minDuration: '18',
        maxDuration: '33',
        minPrice: '8,000',
        minDeliverTip: '2,000',
        maxDeliverTip: '3,000',
        isNew: false,
        canCoupon: false,
        canTakeOut: true,
        canPickUp: true,
        showClean: true,
        canDelivery: true,
        isOpen: false,
      ),
      Store(
        name: 'BHC 명륜점',
        star: 4.9,
        reviewNum: 100,
        description: '뿌링맵소킹 콤보, 양념맴소킹···',
        minDuration: '49',
        maxDuration: '64',
        minPrice: '15,000',
        minDeliverTip: '2,000',
        maxDeliverTip: '2,000',
        isNew: false,
        canCoupon: false,
        canTakeOut: true,
        canPickUp: false,
        showClean: false,
        canDelivery: false,
        isOpen: true,
      ),
      Store(
        name: '맥도날드 부산온천SKDT점',
        star: 3.9,
        reviewNum: 100,
        description: '행운버거 골드 세트, 행운버거···',
        minDuration: '60',
        maxDuration: '75',
        minPrice: '10,000',
        minDeliverTip: '0',
        maxDeliverTip: '2,000',
        isNew: false,
        canCoupon: false,
        canTakeOut: false,
        canPickUp: false,
        showClean: true,
        canDelivery: false,
        isOpen: false,
      ),
    ];

    return ZZimBuildPage(
      storeList: _storeList,
      title: '찜한가게',
      buildContext: buildContext,
      scrollBehaviorSubject: scrollBehaviorSubject,
    );
  }
}
