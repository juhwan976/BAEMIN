import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:roller_list/roller_list.dart';

import 'WhatEatTitle.dart';

class WhatEatPage extends StatefulWidget {
  WhatEatPage({Key? key}) : super(key: key);

  @override
  _WhatEatPageState createState() => _WhatEatPageState();
}

class _WhatEatPageState extends State<WhatEatPage>
    with TickerProviderStateMixin {
  final double _mainAxisSpace = 4.0;
  final double _crossAxisSpace = 4.0;
  List<double> _heights = [
    100,
    100,
    100,
    300,
    200,
    100,
    300,
    100,
    200,
    300,
    200
  ];
  List<String> _menus = ['스테이크', '부대찌개', '싱싱한 회', '보글보글 탕', '치킨', '곱창', '떡볶이'];

  final whatEatRoller = new GlobalKey<RollerListState>();
  Random _random = new Random();
  Timer? rotater;
  int _currentIndex = 0;
  bool _visibleIcon = true;

  double _calculateHeight(List<double> _heights) {
    double resultLeft = _heights.elementAt(0);
    double resultRight = _heights.elementAt(1);

    for (int i = 2; i < _heights.length; i++) {
      if (resultLeft > resultRight) {
        resultRight += _heights.elementAt(i) + _mainAxisSpace;
      } else {
        resultLeft += _heights.elementAt(i) + _mainAxisSpace;
      }
    }

    return (resultRight > resultLeft) ? resultRight : resultLeft;
  }

  String _returnMenu(int categoryNum) {
    String _returnString;

    switch (categoryNum) {
      case 0:
        _returnString = '스테이크';
        _heights = [100, 200, 300, 100, 200, 300, 100, 200, 300, 200];
        break;
      case 1:
        _returnString = '부대찌개';
        _heights = [100, 300, 200, 100, 100, 200, 300, 200, 200, 100];
        break;
      default:
        _returnString = '뭐든지';
        _heights = [100, 100, 100, 300, 200, 100, 300, 100, 200, 300, 200];
    }

    return _returnString;
  }

  List<Widget> _generateMenu() {
    List<Widget> _widgetList = List<Widget>.empty();

    for (int i = 0; i < _menus.length; i++) {
      _widgetList.add(
        WhatEatTitle(title: _menus.elementAt(i)),
      );
    }

    return _widgetList;
  }

  void _startRotating() {
    rotater = Timer.periodic(Duration(milliseconds: 300), _rotateRoller);
  }

  void _rotateRoller(_) {
    final whatEatRotationTarget =
        _random.nextInt(_menus.length) + _menus.length;
    _currentIndex += whatEatRotationTarget;

    whatEatRoller.currentState!.smoothScrollToIndex(
      _currentIndex,
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
    print('Destination : ' + whatEatRotationTarget.toString());
    print('currentIndex : ' + _currentIndex.toString());

    _finishRotating();
  }

  void _finishRotating() {
    rotater?.cancel();
  }

  Widget _buildPage() {
    return RefreshIndicator(
      onRefresh: () async {
        _visibleIcon = false;
        setState(() {});
        await Future.delayed(Duration(milliseconds: 300));
        _startRotating();
      },
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 275,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        WhatEatTitle(title: '오늘은'),
                        Visibility(
                          visible: _visibleIcon,
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RollerList(
                        enabled: false,
                        key: whatEatRoller,
                        length: _menus.length,
                        scrollType: ScrollType.goesOnlyTop,
                        dividerColor: Colors.transparent,
                        items: _generateMenu(),
                        onSelectedIndexChanged: (int index) {
                          _returnMenu((index % _menus.length == 0)
                              ? _menus.length
                              : ((index % _menus.length) - 1));
                          _visibleIcon = true;
                          setState(() {});
                        },
                      ),
                    ),
                    WhatEatTitle(title: '어때요'),
                  ],
                ),
              ),/*
              Container(
                height: _calculateHeight(_heights),
                child: StaggeredGridTile.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: _heights.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: _heights.elementAt(index),
                      color: Colors.green,
                      child: new Center(
                        child: new CircleAvatar(
                          backgroundColor: Colors.white,
                          child: new Text((index + 1).toString()),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.fit(2);
                  },
                  mainAxisSpacing: _mainAxisSpace,
                  crossAxisSpacing: _crossAxisSpace,
                ),
              ),*/
              Container(
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(
          /// 앱바 제목
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          overline: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Scaffold(
        /*
        floatingActionButton: Container(
          height: 80,
          width: 200,
          child: FittedBox(
            child: FloatingActionButton.extended(
              label: Container(

                width: 200,
                child: Text('test', style: TextStyle(fontSize: 30,)),
              ),
              onPressed: () {},
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        */
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 34, 34, 34),
          toolbarHeight: 46,
          elevation: 0.0,
          centerTitle: true,
          title: Text('뭐먹지'),
        ),
        body: Container(
          color: Color.fromARGB(255, 34, 34, 34),
          child: _buildPage(),
        ),
      ),
    );
  }
}
