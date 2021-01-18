import 'package:flutter/material.dart';

import '../Store.dart';
import 'ZZimPin.dart';
import 'ZZimShadowH.dart';

/**
 * 시간적 여유가 된다면 가로에 쓰이는 데이터들은 MediaQuery를 이용한 것으로 교체하기.
 */

class ZZimTemplate extends StatelessWidget {
  const ZZimTemplate({
    Key key,
    @required List<Store> storeList,
  })  : _storeList = storeList,
        super(key: key);

  final List<Store> _storeList;

  double _calculateHeight(int index) {
    double result;
    if (_storeList.elementAt(index - 1).showClean) {
      result = 119;
    } else {
      result = 99;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _storeList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            children: <Widget>[
              Container(
                height: 10,
              ),
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 7, 0, 0),
                      child: Text(
                        '총 ${_storeList.length}개',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Container(
                height: _calculateHeight(index),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.fromLTRB(15, 0, 0,
                          (_storeList.elementAt(index - 1).showClean) ? 20 : 0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Text(
                          '이미지',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                /// 매장 이름
                                padding: EdgeInsets.fromLTRB(0, 17, 0, 3),
                                margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                child: Text(
                                  _storeList.elementAt(index - 1).name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              ZZimPin(
                                /// 쿠폰
                                visible:
                                    _storeList.elementAt(index - 1).canCoupon,
                                title: '쿠폰',
                              ),
                              ZZimPin(
                                /// 포장
                                visible:
                                    _storeList.elementAt(index - 1).canTakeOut,
                                title: '포장',
                              ),
                              ZZimPin(
                                /// 매장
                                visible:
                                    _storeList.elementAt(index - 1).canPickUp,
                                title: '매장',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                  size: 14,
                                ),
                              ),
                              Container(
                                /// 매장 별점
                                padding: EdgeInsets.fromLTRB(1, 0, 2, 0),
                                child: Text(
                                  _storeList
                                      .elementAt(index - 1)
                                      .star
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                /// 매장 리뷰 수
                                child: Text(
                                  '(${_storeList.elementAt(index - 1).reviewNum}+)',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                /// 매장 대표 메뉴
                                child: Text(
                                  ' ' +
                                      _storeList
                                          .elementAt(index - 1)
                                          .description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            /// 최소 주문 금액
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              '최소주문 ' +
                                  _storeList.elementAt(index - 1).minPrice +
                                  '원',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Visibility(
                            /// 위생정보
                            visible: _storeList.elementAt(index - 1).showClean,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                  width: 43,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              (index == _storeList.length)
                  ? Container(
                      height: 1.0,
                      color: Colors.black12,
                    )
                  : ZZimShadowH(),
            ],
          );
        }
      },
    );
  }
}
