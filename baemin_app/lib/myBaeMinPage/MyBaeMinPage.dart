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

/*
 * 이 페이지는 글자 크기가 0.82(작음)으로 된 상태에서 만들어진 페이지 입니다.
 * 글자크기를 1.0(보통)으로 할 경우 깨지는 현상이 발생.
 * 이를 해결하기위해서 글자크기를 고정시키는 방법을 생각 중.
 * 실제로 배민앱의 경우 사용자가 어떤 글자크기를 사용하냐에 상관없이 같은 크기의 글자를 출력함.
 */

class MyBaeMinPage extends StatefulWidget {
  MyBaeMinPage({Key key}) : super(key: key);

  @override
  _MyBaeMinPageState createState() => _MyBaeMinPageState();
}

class _MyBaeMinPageState extends State<MyBaeMinPage> {
  /// 백엔드를 사용하지 않으므로 임의로 유저 클래스를 선언
  User user = new User(
    name: '이름',
    grade: 0,
  );

  /// 유저의 등급을 확인해서 등급별 이미지를 출력하게 할 메서드
  Widget _showGradeImage() {
    return Container();
  }

  /// 페이지의 내용을 리스트 뷰로 만드는 메서드
  ListView _buildListView(
      double _thisHeight, double _thisWidth, double _thisTextScaleFactor) {
    final double _userInfoHeight =
        _thisWidth * 0.22666667; // 85, _thisWidth * 0.22666667
    final double _cateHeight = _thisWidth * 0.21333333; // 80
    final double _leftMargin = _thisWidth * 0.02666667; // 10
    final double _leftFontMargin = _leftMargin + _thisWidth * 0.008; // 3

    return ListView(
      children: <Widget>[
        Container(height: _thisWidth * 0.01866667), // 7
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
                      child: Icon(
                        Icons.supervised_user_circle,
                        size: _userInfoHeight * 0.76470588, // 65
                      ),
                      height: _userInfoHeight * 0.76470588, // 65
                      width: _userInfoHeight * 0.76470588, // 65
                      margin: EdgeInsets.fromLTRB(
                          _leftMargin, 0, _thisWidth * 0.008, 0), // 3
                    ),
                    Container(
                      child: Text(
                        '고마운분,',
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
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditUserInfoPage(user: user),
                ),
              );
            },
          ),
        ),
        MyBaeMinShadowH(),
        Container(
          /// 등급 현황
          height: _thisWidth * 0.14933333, // 56
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
                      icon: Icon(Icons.attach_money),
                      text: '포인트',
                      function: () {},
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinSixButtons(
                      icon: Icon(Icons.money),
                      text: '쿠폰함',
                      function: () {},
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinSixButtons(
                      icon: Icon(Icons.card_giftcard),
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
                      icon: Icon(Icons.favorite),
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
                      icon: Icon(Icons.list),
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
                      icon: Icon(Icons.comment),
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
          height: _thisWidth * 0.02666667, // 10
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
                      margin: EdgeInsets.fromLTRB(
                          _leftMargin, 0, _thisWidth * 0.02666667, 0), // 10
                      child: Icon(
                        Icons.wb_incandescent,
                        size: _thisWidth * 0.16 * 0.5, // 30
                        color: Colors.green,
                      ),
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
          height: _thisWidth * 0.02666667, // 10
        ),
        MyBaeMinTemplateDes(
          leftFontMargin: _leftFontMargin,
          title: '배민페이 등록',
          description: '배민페이로 결제하면 최대 5.5% 배민포인트가 적립됩니다!',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '가족계정 관리',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '선물하기',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '공지사항',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '배민커넥트 지원',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '이벤트',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '고객센터',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '환경설정',
          function: () {},
        ),
        MyBaeMinTemplate(
          leftFontMargin: _leftFontMargin,
          title: '약관 및 정책',
          function: () {},
        ),
        Column(
          /// 현재 버전
          children: <Widget>[
            MyBaeMinShadowH(),
            Container(
              height: _thisWidth * 0.15733333, // 59
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                    child: Text(
                      '현재 버전 10.19.1',
                      textScaleFactor: 0.82,
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Color(0x09000000),
        ),
        Container(
          height: _thisWidth * 0.15733333, // 59
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
  }

  @override
  Widget build(BuildContext context) {
    final double _thisHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double _thisWidth = MediaQuery.of(context).size.width;
    final double _thisTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 0.5,
            color: Colors.black12,
          ),
        ),
        toolbarHeight:
            (Platform.isAndroid) ? _thisHeight * 0.088 : _thisHeight * 0.058,
        // 46
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'My배민',
            textScaleFactor: 0.82,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0x09000000),
        child: _buildListView(_thisHeight, _thisWidth, _thisTextScaleFactor),
      ),
    );
  }
}
