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
  // 백엔드를 사용하지 않으므로 임의로 유저 클래스를 선언
  User user = new User(
    name: '이름',
    grade: 0,
  );

  // 유저의 등급을 확인해서 등급별 이미지를 출력하게 할 메서드
  Widget _showGradeImage() {
    return Container();
  }

  // 페이지의 내용을 리스트 뷰로 만드는 메서드
  ListView _buildListView() {
    final double _userInfoHeight = 85;
    final double _cateHeight = 80;
    final double _leftMargin = 10;
    final double _leftFontMargin = _leftMargin + 3;

    return ListView(
      children: <Widget>[
        Container(height: 7),
        Container(
          // 사용자 정보 출력
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
                      size: 65,
                    ),
                    height: 65,
                    width: 65,
                    margin: EdgeInsets.fromLTRB(_leftMargin, 0, 3, 0),
                  ),
                  Container(
                    child: Text(
                      '고마운분,',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      user.name,
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
        ),
        MyBaeMinShadowH(),
        Container(
          // 등급 현황
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                color: Colors.black12,
                margin: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                child: _showGradeImage(),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: 110,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  ),
                  Positioned(
                    top: 15,
                    bottom: 15,
                    left: 26,
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x09000000),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 18.5,
                    bottom: 5,
                    child: CupertinoButton(
                      child: Text(
                        '등급별 혜택',
                        style: TextStyle(
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
          // 메뉴 6개
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
          height: 10,
        ),
        Container(
          // 일회용품 덜쓰기
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(_leftMargin, 0, 10, 0),
                    child: Icon(
                      Icons.wb_incandescent,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '일회용품 덜 쓰기, 함께해요!',
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
        ),
        Container(
          height: 10,
        ),
        Container(
          // 배민페이 등록
          height: 82,
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
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      '배민페이로 결제하면 최대 5.5% 배민포인트가 적립됩니다!',
                      style: TextStyle(
                        fontSize: 16,
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
          // 현재 버전
          children: <Widget>[
            MyBaeMinShadowH(),
            Container(
              height: 59,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                    child: Text(
                      '현재 버전 10.19.1',
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
          height: 59,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Copyright Woowa Brothers in Song-pa, All Rights Reserved.',
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
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        bottom: PreferredSize(
          child: Container(
            height: 1.0,
            color: Colors.black12,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        toolbarHeight: 46.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('My배민'),
      ),
      body: Container(
        color: Color(0x09000000),
        child: _buildListView(),
      ),
    );
  }
}
