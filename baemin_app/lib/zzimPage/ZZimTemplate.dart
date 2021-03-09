import 'package:baemin_app/storeDetailPage/StoreDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/rxdart.dart';

import '../Store.dart';
import 'ZZimPin.dart';
import 'ZZimShadowH.dart';

///*****************************************************************************
///
/// 찜한가게 페이지에서 가게 리스트를 출력할 템플릿을 빌드하는 위젯
///
/// @ 매개변수
///             Key                     key
/// @required   List<Store>             storeList
/// @required   BuildContext            buildContext
/// @required   BehaviorSubject<bool>   scrollBehaviorSubject
///
/// [storeList] : 출력할 가게들이 들어있는 리스트
/// [buildContext] : PrimaryScrollController 를 위해 가져온 ZZimPage 의 BuildContext
/// [scrollStreamController] :  아이폰에서 statusBar 를 터치할 경우
///                             스크롤을 가장 위로 옮기는 기능을 구현하기 위해서 사용
///
/// @ 매서드
/// double    _calculateHeight(int index)
/// double    _calculateBottomMargin(int index)
/// String    _makeDeliverTipString(int index)
/// String    _makeDurationNMinPriceString(int index)
///
/// Widget    build(BuildContext context)
///
///
/// @ 기타
/// 가게마다 현재 배달받을 장소에서 배달이 가능한지에 따라서 나오는 항목이 다르다.
///
/// 가게가 준비중일 경우 배달 시간은 나오지 않는다. 하지만 배달팁은 출력
///
/// 배달이 불가능한 지역에 있을 때 그 가게가 준비중인 경우에 대한 데이터가 필요하다.
/// -> 최소 주문 금액만 출력
///
///*****************************************************************************
///
class ZZimTemplate extends StatelessWidget {
  const ZZimTemplate({
    Key key,
    @required List<Store> storeList,
    @required this.buildContext,
    @required this.scrollBehaviorSubject,
  })  : _storeList = storeList,
        super(key: key);

  final List<Store> _storeList;
  final BuildContext buildContext;
  final BehaviorSubject<bool> scrollBehaviorSubject;

  /// 표시될 항목들의 개수에 따라서 한 칸의 높이를 계산하는 메서드
  double _calculateHeight(int index) {
    double result;

    if (_storeList.elementAt(index).showClean &&
        !_storeList.elementAt(index).canDelivery) {
      result = 119;
    } else if (!_storeList.elementAt(index).showClean &&
        _storeList.elementAt(index).canDelivery) {
      result = 119;
    } else if (_storeList.elementAt(index).showClean &&
        _storeList.elementAt(index).canDelivery) {
      result = 139;
    } else {
      result = 99;
    }

    return result;
  }

  /// 표시될 항목들의 개수에 따라서 한 칸의 아래쪽 마진을 계산하는 메서드
  double _calculateBottomMargin(int index) {
    if (_storeList.elementAt(index).showClean) {
      if (_storeList.elementAt(index).canDelivery) {
        return 40;
      } else {
        return 20;
      }
    } else {
      if (_storeList.elementAt(index).canDelivery) {
        return 20;
      } else {
        return 0;
      }
    }
  }

  /// 배달팁의 범위에 따라서 표시될 배달팁 구문을 만드는 메서드
  String _makeDeliverTipString(int index) {
    if (_storeList.elementAt(index).minDeliverTip ==
        _storeList.elementAt(index).maxDeliverTip) {
      return '배달팁 ' + _storeList.elementAt(index).minDeliverTip + '원';
    } else {
      return '배달팁 ' +
          _storeList.elementAt(index).minDeliverTip +
          '원~' +
          _storeList.elementAt(index).maxDeliverTip +
          '원';
    }
  }

  /// 가게의 상황에 따라서 소요시간 및 최소 주문 금액 구문을 만드는 메서드
  String _makeDurationNMinPriceString(int index) {
    if (_storeList.elementAt(index).canDelivery &&
        _storeList.elementAt(index).isOpen) {
      return _storeList.elementAt(index).minDuration +
          '~' +
          _storeList.elementAt(index).maxDuration +
          '분, 최소주문 ' +
          _storeList.elementAt(index).minPrice +
          '원';
    } else {
      return '최소주문 ' + _storeList.elementAt(index).minPrice + '원';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        PrimaryScrollController.of(buildContext);

    return StreamBuilder(
        stream: scrollBehaviorSubject.stream,
        initialData: scrollBehaviorSubject.value ?? false,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller:
                  snapshot.data ? _scrollController : ScrollController(),
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
                                textScaleFactor: 0.82,
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
                        height: _calculateHeight(index - 1),
                        color: Colors.white,
                        child: GestureDetector(
                          child: Stack(
                            children: <Widget>[
                              /// 내용
                              Row(
                                children: <Widget>[
                                  /// 매장 대표이미지
                                  Container(
                                    height: 70,
                                    width: 70,
                                    margin: EdgeInsets.fromLTRB(15, 0, 0,
                                        _calculateBottomMargin(index - 1)),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '이미지',
                                        textScaleFactor: 0.82,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            /// 매장 이름
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 17, 0, 3),
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 3, 0),
                                              child: Text(
                                                _storeList
                                                    .elementAt(index - 1)
                                                    .name,
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19),
                                              ),
                                            ),

                                            /// 신규
                                            ZZimPin(
                                              visible: _storeList
                                                  .elementAt(index - 1)
                                                  .isNew,
                                              title: '신규',
                                            ),

                                            /// 쿠폰
                                            ZZimPin(
                                              visible: _storeList
                                                  .elementAt(index - 1)
                                                  .canCoupon,
                                              title: '쿠폰',
                                            ),

                                            /// 포장
                                            ZZimPin(
                                              visible: _storeList
                                                  .elementAt(index - 1)
                                                  .canTakeOut,
                                              title: '포장',
                                            ),

                                            /// 매장
                                            ZZimPin(
                                              visible: _storeList
                                                  .elementAt(index - 1)
                                                  .canPickUp,
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

                                            /// 매장 별점
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  1, 0, 2, 0),
                                              child: Text(
                                                _storeList
                                                    .elementAt(index - 1)
                                                    .star
                                                    .toString(),
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),

                                            /// 매장 리뷰 수
                                            Container(
                                              child: Text(
                                                '(${_storeList.elementAt(index - 1).reviewNum}+)',
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),

                                            /// 매장 대표 메뉴
                                            Container(
                                              child: Text(
                                                ' ' +
                                                    _storeList
                                                        .elementAt(index - 1)
                                                        .description,
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            /// 타이머 아이콘
                                            Visibility(
                                              visible: _storeList
                                                      .elementAt(index - 1)
                                                      .canDelivery &&
                                                  _storeList
                                                      .elementAt(index - 1)
                                                      .isOpen,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 8, 0, 0),
                                                height: 15,
                                                child: Image.asset(
                                                    'assets/ZZim/icon_14_time.png'),
                                              ),
                                            ),

                                            /// 소요시간 및 최소 주문 금액
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                              child: Text(
                                                _makeDurationNMinPriceString(
                                                    index - 1),
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        /// 배달팁
                                        Visibility(
                                          visible: _storeList
                                              .elementAt(index - 1)
                                              .canDelivery,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Text(
                                              _makeDeliverTipString(index - 1),
                                              textScaleFactor: 0.82,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: (!_storeList
                                                        .elementAt(index - 1)
                                                        .isOpen)
                                                    ? Colors.black45
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ),

                                        /// 위생정보
                                        Visibility(
                                          visible: _storeList
                                              .elementAt(index - 1)
                                              .showClean,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 6, 0, 0),
                                            width: 43,
                                            height: 17,
                                            decoration: BoxDecoration(
                                              color: Color(0x0A000000),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '위생정보',
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              /// 가게가 준비중일 때 비활성으로 보이게 할 컨테이너
                              Visibility(
                                visible:
                                    !_storeList.elementAt(index - 1).isOpen,
                                child: Container(
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              /// 가게가 준비중일 때 이미지 위에 준비중으로 보이게 할 컨테이너
                              Visibility(
                                visible:
                                    !_storeList.elementAt(index - 1).isOpen,
                                child: Container(
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      margin: EdgeInsets.fromLTRB(15, 15, 0,
                                          _calculateBottomMargin(index - 1)),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '준비중',
                                          textScaleFactor: 0.82,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoreDetailPage(
                                  store: _storeList.elementAt(index - 1),
                                ),
                              ),
                            );
                          },
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
            ),
          );
        });
  }
}
