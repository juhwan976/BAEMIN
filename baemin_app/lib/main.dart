import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';

import 'NavigationIcon.dart';
import 'homePage/HomePage.dart';
import 'myBaeMinPage/MyBaeMinPage.dart';
import 'orderListPage/OrderListPage.dart';
import 'searchPage/SearchPage.dart';
import 'zzimPage/ZZimPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      debugShowCheckedModeBanner: false,
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
  StreamController<bool> _searchPageStreamController = new BehaviorSubject();
  StreamController<bool> _zzimPageStreamController = new BehaviorSubject();
  StreamController<bool> _myBaeMinPageStreamController = new BehaviorSubject();

  int _selectedIndex = 0;

  List<Widget> _pageList = new List<Widget>();

  void _onTaped(int index) {
    _selectedIndex = index;

    switch(index) {
      case 0:
        _searchPageStreamController.sink.add(false);
        _zzimPageStreamController.sink.add(false);
        _myBaeMinPageStreamController.sink.add(false);
        break;
      case 1:
        _searchPageStreamController.sink.add(true);
        _zzimPageStreamController.sink.add(false);
        _myBaeMinPageStreamController.sink.add(false);
        break;
      case 2:
        _searchPageStreamController.sink.add(false);
        _zzimPageStreamController.sink.add(true);
        _myBaeMinPageStreamController.sink.add(false);
        break;
      case 3:
        _searchPageStreamController.sink.add(false);
        _zzimPageStreamController.sink.add(false);
        _myBaeMinPageStreamController.sink.add(false);
        break;
      case 4:
        _searchPageStreamController.sink.add(false);
        _zzimPageStreamController.sink.add(false);
        _myBaeMinPageStreamController.sink.add(true);
        break;
      default:
        break;
    }

    HapticFeedback.mediumImpact();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _pageList.add(HomePage());
    _pageList.add(SearchPage(scrollStreamController: _searchPageStreamController));
    _pageList.add(ZZimPage(scrollBehaviorSubject: _zzimPageStreamController, fromAnotherPage: false));
    _pageList.add(OrderListPage(fromAnotherPage: false,));
    _pageList.add(MyBaeMinPage(scrollStreamController: _myBaeMinPageStreamController));
  }

  @override
  void dispose() {
    super.dispose();

    _searchPageStreamController.close();
    _zzimPageStreamController.close();
    _myBaeMinPageStreamController.close();
  }

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
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 85 : 55,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: NavigationIcon(
                  selectedIndex: _selectedIndex,
                  compareIndex: 0,
                  normalIcon:
                      'assets/Navigation/ic_main_navigation_home_normal.png',
                  selectedIcon:
                      'assets/Navigation/ic_main_navigation_home_selected.png',
                  title: '홈',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavigationIcon(
                  selectedIndex: _selectedIndex,
                  compareIndex: 1,
                  normalIcon: 'assets/Navigation/icon_30_tabbar_search.png',
                  selectedIcon:
                      'assets/Navigation/icon_30_tabbar_search_select.png',
                  title: '검색',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavigationIcon(
                  selectedIndex: _selectedIndex,
                  compareIndex: 2,
                  normalIcon:
                      'assets/Navigation/ic_main_navigation_favorite_normal.png',
                  selectedIcon:
                      'assets/Navigation/ic_main_navigation_favorite_selected.png',
                  title: '찜한가게',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavigationIcon(
                  selectedIndex: _selectedIndex,
                  compareIndex: 3,
                  normalIcon:
                      'assets/Navigation/ic_main_navigation_order_history_normal.png',
                  selectedIcon:
                      'assets/Navigation/ic_main_navigation_order_history_selected.png',
                  title: '주문내역',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavigationIcon(
                  selectedIndex: _selectedIndex,
                  compareIndex: 4,
                  normalIcon:
                      'assets/Navigation/ic_main_navigation_my_baemin_normal.png',
                  selectedIcon:
                      'assets/Navigation/ic_main_navigation_my_baemin_selected.png',
                  title: 'my배민',
                ),
                label: '',
              ),
            ],
            selectedItemColor: Colors.transparent,
            unselectedItemColor: Colors.transparent,
            selectedFontSize: 0.0,
            // 패딩 없애려고 사용
            currentIndex: _selectedIndex,
            onTap: _onTaped,
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pageList,
      ),
    );
  }
}
