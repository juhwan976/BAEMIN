import 'package:flutter/material.dart';

import '../../Store.dart';
import '../ZZimTemplate.dart';

class ZZimed extends StatelessWidget {
  const ZZimed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = [
      Store(
        name: '착한피자',
        star: 5.0,
        reviewNum: 100,
        description: '클래식고구마피자, 클래식콤비···',
        minPrice: '14,900',
        canCoupon: true,
        canTakeOut: true,
        canPickUp: true,
        showClean: false,
      ),
      Store(
        name: '푸라닭 명륜점',
        star: 4.9,
        reviewNum: 100,
        description: '제네럴 핫 윙콤보, 블랙투움바',
        minPrice: '15,900',
        canCoupon: false,
        canTakeOut: true,
        canPickUp: false,
        showClean: false,
      ),
      Store(
        name: '달랏 쌀국수',
        star: 4.9,
        reviewNum: 100,
        description: '달랏쌀국수+새우요리(2인), 달···',
        minPrice: '7,000',
        canCoupon: true,
        canTakeOut: false,
        canPickUp: false,
        showClean: false,
      ),
      Store(
        name: '맘스터치 동래명륜점',
        star: 4.7,
        reviewNum: 100,
        description: '고기가득 리얼비프버거 세트, N···',
        minPrice: '8,000',
        canCoupon: false,
        canTakeOut: true,
        canPickUp: true,
        showClean: true,
      ),
      Store(
        name: 'BHC 명륜점',
        star: 4.9,
        reviewNum: 100,
        description: '뿌링맵소킹 콤보, 양념맴소킹···',
        minPrice: '15,000',
        canCoupon: false,
        canTakeOut: true,
        canPickUp: false,
        showClean: false,
      ),
      Store(
        name: '맥도날드 부산온천SKDT점',
        star: 3.9,
        reviewNum: 100,
        description: '행운버거 골드 세트, 행운버거···',
        minPrice: '10,000',
        canCoupon: false,
        canTakeOut: false,
        canPickUp: false,
        showClean: true,
      ),
    ];

    if (_storeList.length == 0) {
      return Container(
        color: Color(0x09000000),
      );
    } else {
      return Container(
        color: Color(0x09000000),
        child: ZZimTemplate(storeList: _storeList),
      );
    }
  }
}