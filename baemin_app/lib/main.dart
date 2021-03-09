import 'dart:async';
import 'dart:developer';
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

  /// 네이게이션을 터치했을 경우 실행될 메서드
  void _onTaped(int index) {
    _selectedIndex = index;

    /// IndexedStack 을 사용함으로써 발생하는 문제점을 해결하기 위한 해결법 (iOS 만 해당)
    /// IndexedStack 은 모든 화면이 출력중인 상태이므로 현재 보고있는 화면에서
    /// statusBar 를 터치할 경우, 모든 페이지의 스크롤이 가장 위로 이동하게 된다.
    /// 이를 해결하고자 출력중인 페이지를 인식해서 statusBar 를 터치할 경우 그 페이지의 스크롤만
    /// 가장 위로 올리기 위해서 Stream 을 이용해서 구현했다.
    ///
    /// BehaviorSubject 를 쓴 이유
    /// 들어있는 값들 중 가장 마지막에 추가된 값을 알고싶어서 사용.
    /// 하지만, StreamBuilder 를 사용했기 때문에
    /// StreamController 를 사용해도 큰 문제가 없을 것 같다.
    switch (index) {
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

    /// 진동기능 테스트할겸 추가
    HapticFeedback.mediumImpact();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    /// page 들 추가
    _pageList.clear();
    _pageList.add(HomePage());
    _pageList
        .add(SearchPage(scrollStreamController: _searchPageStreamController));
    _pageList.add(
      ZZimPage(
        scrollBehaviorSubject: _zzimPageStreamController,
        fromAnotherPage: false,
      ),
    );
    _pageList.add(
      OrderListPage(
        fromAnotherPage: false,
      ),
    );
    _pageList.add(
        MyBaeMinPage(scrollStreamController: _myBaeMinPageStreamController));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 이미지 미리 불러오기
    precacheImage(AssetImage('assets/Navigation/ic_main_navigation_home_selected.png'), context);
    precacheImage(AssetImage('assets/Navigation/ic_main_navigation_favorite_selected.png'), context);
    precacheImage(AssetImage('assets/Navigation/ic_main_navigation_order_history_selected.png'), context);
    precacheImage(AssetImage('assets/Navigation/ic_main_navigation_my_baemin_selected.png'), context);
    precacheImage(AssetImage('assets/Navigation/icon_30_tabbar_search_select.png'), context);
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
    /// 기기 정보 출력 구문
    log('높이 : ' +
        MediaQuery.of(context).size.height.toString() +
        ', 너비 : ' +
        MediaQuery.of(context).size.width.toString() +
        ', 상태바 높이 : ' +
        MediaQuery.of(context).padding.top.toString() +
        ', 화면 실제 높이 : ' +
        (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top)
            .toString() +
        ', textScaleFactor : ' +
        MediaQuery.of(context).textScaleFactor.toString() +
        ', 플랫폼 : ' +
        ((Platform.isAndroid) ? '안드로이드' : ((Platform.isIOS) ? 'iOS' : '알수없음')));

    return Scaffold(
      body: IndexedStack(
        children: _pageList,
        index: _selectedIndex,
      ),
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
    );
  }
}
