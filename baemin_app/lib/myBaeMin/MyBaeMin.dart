import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../User.dart';
import 'MyBaeMinArrow.dart';
import 'MyBaeMinButton.dart';
import 'MyBaeMinShadowH.dart';
import 'MyBaeMinShadowV.dart';
import 'MyBaeMinTemplate.dart';

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
    final double _userInfoHeight = _thisHeight * 0.11067708;
    final double _cateHeight = _thisHeight * 0.10416667;
    final double _leftMargin = _thisWidth * 0.02666667;
    final double _leftFontMargin = _leftMargin + (_thisWidth * 0.008);

    return ListView(
      children: <Widget>[
        Container(height: _thisHeight * 0.00911458),
        Container(
          /// 사용자 정보 출력
          height: _userInfoHeight,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: _thisWidth * 0.17333333,
                    ),
                    height: _thisWidth * 0.17333333,
                    width: _thisWidth * 0.17333333,
                    margin: EdgeInsets.fromLTRB(
                        _leftMargin, 0, _thisWidth * 0.008, 0),
                  ),
                  Container(
                    child: Text(
                      '고마운분,',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      user.name,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              MyBaeMinArrow(),
            ],
          ),
        ),
        MyBaeMinShadowH(),
        Container(
          /// 등급 현황
          height: _thisHeight * 0.07291667,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: _thisWidth * 0.53333333,
                color: Colors.black12,
                margin: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                child: _showGradeImage(),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: _thisWidth * 0.29333333,
                    margin: EdgeInsets.fromLTRB(0, 0, _thisWidth * 0.04, 0),
                  ),
                  Positioned(
                    top: _thisHeight * 0.01953125,
                    bottom: _thisHeight * 0.01953125,
                    left: _thisWidth * 0.06933333,
                    child: Container(
                      width: _thisWidth * 0.21333333,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x09000000),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _thisHeight * 0.00651042,
                    left: _thisWidth * 0.04933333,
                    bottom: _thisHeight * 0.00651042,
                    child: CupertinoButton(
                      child: Text(
                        '등급별 혜택',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 13.94,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
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
                    child: MyBaeMinButton(
                      icon: Icon(Icons.attach_money),
                      text: '포인트',
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinButton(
                      icon: Icon(Icons.money),
                      text: '쿠폰함',
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinButton(
                      icon: Icon(Icons.card_giftcard),
                      text: '선물함',
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
                    child: MyBaeMinButton(
                      icon: Icon(Icons.favorite),
                      text: '찜한가게',
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinButton(
                      icon: Icon(Icons.list),
                      text: '주문내역',
                    ),
                  ),
                  MyBaeMinShadowV(),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 1,
                    child: MyBaeMinButton(
                      icon: Icon(Icons.comment),
                      text: '리뷰관리',
                    ),
                  ),
                ],
              ),
            ),
            MyBaeMinShadowH(),
          ],
        ),
        Container(
          height: _thisHeight * 0.01302083,
        ),
        Container(
          /// 일회용품 덜쓰기
          height: _thisHeight * 0.0728125,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(_leftMargin, 0, _thisWidth * 0.02666667, 0),
                    child: Icon(
                      Icons.wb_incandescent,
                      size: _thisWidth * 0.08,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '일회용품 덜 쓰기, 함께해요!',
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.58,
                    ),
                  ),
                ],
              ),
              MyBaeMinArrow(),
            ],
          ),
        ),
        Container(
          height: _thisHeight * 0.01302083,
        ),
        Container(
          /// 배민페이 등록
          height: _thisHeight * 0.10677083,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '배민페이 등록',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 15.58,
                      ),
                    ),
                    Text(
                      '배민페이로 결제하면 최대 5.5% 배민포인트가 적립됩니다!',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 13.12,
                        color: Color(0x70000000),
                      ),
                    ),
                  ],
                ),
              ),
              MyBaeMinArrow(),
            ],
          ),
        ),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '가족계정 관리'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '선물하기'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '공지사항'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '배민커넥트 지원'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '이벤트'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '고객센터'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '환경설정'),
        MyBaeMinTemplate(leftFontMargin: _leftFontMargin, title: '약관 및 정책'),
        Column(
          /// 현재 버전
          children: <Widget>[
            MyBaeMinShadowH(),
            Container(
              height: _thisHeight * 0.07682292,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                    child: Text(
                      '현재 버전 10.19.1',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 15.58,
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
          height: _thisHeight * 0.07682292,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Copyright Woowa Brothers in Song-pa, All Rights Reserved.',
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 9.84,
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
          child: Container(
            height: _thisHeight / _thisHeight,
            color: Colors.black12,
          ),
          preferredSize: Size.fromHeight(_thisHeight / _thisHeight),
        ),
        toolbarHeight: _thisHeight * 0.06,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'My배민',
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 16,
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
