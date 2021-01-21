import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/Home.dart';
import 'myBaeMin/MyBaeMin.dart';
import 'orderList/OrderList.dart';
import 'whatEat/WhatEat.dart';
import 'zzim/ZZim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배달의 민족',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          /// 제목
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '배달의 민족 Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onTaped(int index) {
    _selectedIndex = index;
    HapticFeedback.mediumImpact();
    setState(() {});
  }

  List<Widget> _listWidget = <Widget>[
    HomePage(),
    WhatEatPage(),
    ZZimPage(),
    OrderListPage(),
    MyBaeMinPage(),
  ];

  @override
  Widget build(BuildContext context) {
    print('높이 : ' +
        MediaQuery.of(context).size.height.toString() +
        ' 너비 : ' +
        MediaQuery.of(context).size.width.toString());
    print('상태바 높이 : ' + MediaQuery.of(context).padding.top.toString());
    print('화면 시작높이 : ' +
        (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top)
            .toString());
    print('textFactor : ' + MediaQuery.of(context).textScaleFactor.toString());
    print('플랫폼 : ' +
        ((Platform.isAndroid) ? '안드로이드' : ((Platform.isIOS) ? 'iOS' : '알수없음')));

    return Scaffold(
      body: _listWidget.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: '뭐먹지',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '찜한가게',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '주문내역',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'my배민',
            ),
          ],
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onTaped,
        ),
      ),
    );
  }
}
