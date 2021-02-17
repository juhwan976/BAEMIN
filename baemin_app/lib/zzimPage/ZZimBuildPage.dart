import 'package:flutter/material.dart';

import '../Store.dart';
import 'ZZimTemplate.dart';

Widget ZZimBuildPage(List<Store> _storeList, String title) {
  Widget returnWidget;

  if (_storeList.isEmpty) {
    if (title == '찜한가게') {
      returnWidget = Center(
        child: Container(
          height: 320,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/ZZim/favorite.png',
                width: 375 * 0.63,
              ),
              Container(
                height: 41,
              ),
              Text(
                '자주 찾는 가게를',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
              Text(
                '찜 해보세요',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (title == '바로결제') {
      returnWidget = Center(
        child: Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/ZZim/image_no_item_tung.png',
                width: 375 * 0.63,
              ),
              Container(
                height: 41,
              ),
              Text(
                '최근 주문내역이 없어요',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      returnWidget = Center(
        child: Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/ZZim/image_no_item_tung.png',
                width: 375 * 0.63,
              ),
              Container(
                height: 41,
              ),
              Text(
                '최근 주문내역이 없어요',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      );
    }
  } else {
    returnWidget = ZZimTemplate(storeList: _storeList);
  }

  return Container(
    color: Color(0x09000000),
    child: returnWidget,
  );
}
