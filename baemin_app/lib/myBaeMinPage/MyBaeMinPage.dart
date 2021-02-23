import 'dart:async';
import 'dart:io';

import 'package:baemin_app/orderListPage/OrderListPage.dart';
import 'package:baemin_app/zzimPage/ZZimPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../User.dart';
import 'MyBaeMinArrow.dart';
import 'MyBaeMinButton.dart';
import 'MyBaeMinShadowH.dart';
import 'MyBaeMinShadowV.dart';
import 'MyBaeMinSixButtons.dart';
import 'MyBaeMinTemplate.dart';
import 'MyBaeMinTemplateDes.dart';
import 'pages/EditUserInfoPage.dart';

class MyBaeMinPage extends StatefulWidget {
  MyBaeMinPage({
    Key key,
    this.scrollStreamController,
  }) : super(key: key);

  final StreamController<bool> scrollStreamController;

  @override
  _MyBaeMinPageState createState() => _MyBaeMinPageState();
}

class _MyBaeMinPageState extends State<MyBaeMinPage> {
  /// 백엔드를 사용하지 않으므로 임의로 유저 클래스를 선언
  User user = new User(
    name: '이름',
    grade: 0,
  );

  /// 유저 등급에 따라서 표시되는 구문을 다르게 하는 메서드
  String _returnGradeString() {
    switch (user.grade) {
      case 0:
        return '고마운분,';
        break;
      default:
        return '고마운분,';
        break;
    }
  }

  /// 유저의 등급을 확인해서 등급별 이미지를 출력하게 할 메서드
  Widget _showGradeImage() {
    return Container();
  }

  /// 페이지의 내용을 빌드하는 메서드
  Widget _buildPage(
      double _thisHeight, double _thisWidth) {
    final double _userInfoHeight = (Platform.isIOS)
        ? _thisWidth * 0.22666667
        : 85; // 85, _thisWidth * 0.22666667
    final double _cateHeight =
        (Platform.isIOS) ? _thisWidth * 0.21333333 : 80; // 80
    final double _leftMargin = _thisWidth * 0.02666667; // 10
    final double _leftFontMargin = _leftMargin + _thisWidth * 0.008; // 3

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: StreamBuilder(
          stream: widget.scrollStreamController.stream,
          initialData: false,
          builder: (BuildContext streamContext, AsyncSnapshot<bool> snapshot) {
            return ListView(
              controller: snapshot.data ? PrimaryScrollController.of(context) : ScrollController(),
              children: <Widget>[
                Container(
                    height: (Platform.isIOS) ? _thisWidth * 0.01866667 : 10),
                // 7
                Container(
                  /// 사용자 정보 출력
                  height: _userInfoHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: MyBaeMinButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                  'assets/MyBaemin/img_my_baemin_default_profile.png'),
                              height: _userInfoHeight * 0.6, // 51
                              width: _userInfoHeight * 0.76470588, // 65
                              margin: EdgeInsets.fromLTRB(
                                  _leftMargin, 0, _thisWidth * 0.008, 0), // 3
                            ),
                            Container(
                              child: Text(
                                _returnGradeString(),
                                textScaleFactor: 0.82,
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                user.name,
                                textScaleFactor: 0.82,
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        MyBaeMinArrow(),
                      ],
                    ),
                    function: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUserInfoPage(user: user),
                        ),
                      );

                      if (result == null) {
                        /* do nothing */
                      } else {
                        user.name = result;
                        setState(() {});
                      }
                    },
                  ),
                ),
                MyBaeMinShadowH(),
                Container(
                  /// 등급 현황
                  height: (Platform.isIOS) ? _thisWidth * 0.14933333 : 69, // 56
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: _thisWidth * 0.53333333, // 200
                        color: Colors.black12,
                        margin: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                        child: _showGradeImage(),
                      ),
                      Container(
                        /// 등급별 혜택 버튼
                        width: _thisWidth * 0.21333333,
                        // 80
                        height: _thisWidth * 0.06933333,
                        // 26
                        margin: EdgeInsets.fromLTRB(
                            0, 0, _thisWidth * 0.14933333 * 0.30357143, 0),
                        // 17
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x09000000),
                        ),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Text(
                            '등급별 혜택',
                            textScaleFactor: 0.82,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                MyBaeMinShadowH(),
                Column(
                  /// 메뉴 6개
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: _cateHeight,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory: 'assets/MyBaemin/mybaemin_point.png',
                              text: '포인트',
                              function: () {},
                            ),
                          ),
                          MyBaeMinShadowV(),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory: 'assets/MyBaemin/mybaemin_coupon.png',
                              text: '쿠폰함',
                              function: () {},
                            ),
                          ),
                          MyBaeMinShadowV(),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory:
                                  'assets/MyBaemin/icon_42_mybaemin_gift.png',
                              text: '선물함',
                              function: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyBaeMinShadowH(),
                    Container(
                      height: _cateHeight,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory:
                                  'assets/MyBaemin/icon_42_mybaemin_favorite.png',
                              text: '찜한가게',
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ZZimPage(fromAnotherPage: true),
                                  ),
                                );
                              },
                            ),
                          ),
                          MyBaeMinShadowV(),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory: 'assets/MyBaemin/mybaemin_history.png',
                              text: '주문내역',
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OrderListPage(fromAnotherPage: true),
                                  ),
                                );
                              },
                            ),
                          ),
                          MyBaeMinShadowV(),
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            child: MyBaeMinSixButtons(
                              directory: 'assets/MyBaemin/mybaemin_review.png',
                              text: '리뷰관리',
                              function: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyBaeMinShadowH(),
                  ],
                ),
                Container(
                  height: (Platform.isIOS) ? _thisWidth * 0.02666667 : 8, // 10
                ),
                Container(
                  /// 일회용품 덜쓰기
                  height: _thisWidth * 0.16, // 60
                  color: Colors.white,
                  child: MyBaeMinButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: _thisWidth * 0.10666667,
                              // 40
                              width: _thisWidth * 0.10666667,
                              // 40
                              margin: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                              // 10
                              child: Image.asset(
                                  'assets/MyBaemin/deco_campaign_tape_right.png'),
                            ),
                            Text(
                              '일회용품 덜 쓰기, 함께해요!',
                              textScaleFactor: 0.82,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        MyBaeMinArrow(),
                      ],
                    ),
                    function: () {},
                  ),
                ),
                Container(
                  height: (Platform.isIOS) ? _thisWidth * 0.02666667 : 8, // 10
                ),
                MyBaeMinTemplateDes(
                  leftFontMargin: _leftFontMargin,
                  title: '배민페이 등록',
                  description: '배민페이로 결제하면 최대 5.5% 배민포인트가 적립됩니다!',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplateDes(
                  leftFontMargin: _leftFontMargin,
                  title: '가족계정 관리',
                  description: '결제수단을 공유해 우리 가족의 끼니를 챙겨주세요.',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '선물하기',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '공지사항',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '배민커넥트 지원',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '이벤트',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '고객센터',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '환경설정',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                MyBaeMinTemplate(
                  leftFontMargin: _leftFontMargin,
                  title: '약관 및 정책',
                  function: () {},
                ),
                MyBaeMinShadowH(),
                Container(
                  /// 현재 버전
                  height: (Platform.isIOS) ? _thisWidth * 0.15733333 : 59, // 59
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                        child: Text(
                          (Platform.isIOS) ? '현재 버전 10.21.0' : '현재 버전 10.21.1',
                          textScaleFactor: 0.82,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(0x09000000),
                ),
                Container(
                  height: (Platform.isIOS) ? _thisWidth * 0.14133333 : 53, // 53
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Copyright Woowa Brothers in Song-pa, All Rights Reserved.',
                        textScaleFactor: 0.82,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0x70000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    widget.scrollStreamController.sink.add(false);
  }

  @override
  Widget build(BuildContext context) {
    final double _thisHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double _thisWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          bottom: PreferredSize(
            preferredSize: null,
            child: Container(
              height: 0.5,
              color: Colors.black12,
            ),
          ),
          toolbarHeight: (Platform.isIOS) ? _thisHeight * 0.058 : 53,
          // 46
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'My배민',
            textScaleFactor: 0.82,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Container(
          color: Color(0x09000000),
          child: _buildPage(_thisHeight, _thisWidth),
        ),
      ),
    );
  }
}
