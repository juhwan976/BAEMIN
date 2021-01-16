import 'package:flutter/material.dart';

import '../../Store.dart';
import '../ZZimShadowH.dart';

class ZZimed extends StatelessWidget {
  const ZZimed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = [
      Store(
        name: '맘스터치 동래명륜점',
        star: 4.7,
        reviewNum: 100,
        description: '행운버거 골드 세트, 행운버거···',
        minPrice: '8,000',
        canTakeOut: true,
        showClean: true,
      ),
      Store(
        name: '맥도날드 부산온천SKDT점',
        star: 3.9,
        reviewNum: 100,
        description: '고기가득 리얼비프버거 세트, N···',
        minPrice: '10,000',
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
        child: ListView.builder(
          itemCount: _storeList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if(index == 0) {
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
            }
            else {
              return Column(
                children: [
                  Container(
                    height: 119,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 20),
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(25.0),
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
                                    padding: EdgeInsets.fromLTRB(0,17,0,3),
                                    child: Text(
                                      _storeList.elementAt(index - 1).name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 19),
                                    ),
                                  ),
                                  Visibility(
                                    /// 쿠폰
                                    visible: false,
                                    child: Container(),
                                  ),
                                  Visibility(
                                    /// 포장
                                    visible: false,
                                    child: Container(),
                                  ),
                                  Visibility(
                                    /// 매장
                                    visible: false,
                                    child: Container(),
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
                                    padding: EdgeInsets.fromLTRB(1,0,2,0),
                                    child: Text(
                                      _storeList.elementAt(index - 1).star.toString(),
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
                                      ' ' + _storeList.elementAt(index - 1).description,
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
                                margin: EdgeInsets.fromLTRB(0,8,0,0),
                                child: Text(
                                  '최소주문 ' + _storeList.elementAt(index - 1).minPrice + '원',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: false,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ZZimShadowH(),
                ],
              );
            }
          }
        ),
      );
    }
  }
}

