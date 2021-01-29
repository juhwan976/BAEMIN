import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Display.dart';
import 'WhatEatTitle.dart';

class WhatEatPage extends StatefulWidget {
  WhatEatPage({Key key}) : super(key: key);

  @override
  _WhatEatPageState createState() => _WhatEatPageState();
}

class _WhatEatPageState extends State<WhatEatPage> {
  List<Display> _displays = new List<Display>();

  double _calculateHeight(List<double> _heights) {
    double _resultEven = 0, _resultOdd = 0;

    for(int i = 0 ; i < _heights.length ; i++) {
      if(i%2==0) {
        _resultEven += _heights[i];
      }
      else {
        _resultOdd += _heights[i];
      }
    }

    return (_resultEven > _resultOdd) ? _resultEven : _resultOdd;
  }

  String _returnMenu(int categoryNum) {
    String _returnString;

    switch (categoryNum) {
      case 0:
        _returnString = '스테이크';
        break;
      case 1:
        _returnString = '부대찌개';
        break;
      default:
        _returnString = '뭐든지';
    }

    return _returnString;
  }

  Widget _buildPage() {
    Random _rnd = new Random();
    int _categoryNum = _rnd.nextInt(3); // 0 ~ 2 사이의 랜덤한 수 생성
    List<double> _heights = [100,200,300,400,500,600/*,700,800,900,1000*/];

    print(_heights.length~/2 + 1);

    return ListView(
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
                  WhatEatTitle(title: '오늘은'),
                  WhatEatTitle(title: _returnMenu(_categoryNum)),
                  WhatEatTitle(title: '어때요'),
                ],
              ),
            ),
            Container(
              height: _calculateHeight(_heights),
              child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                itemCount: _heights.length,
                itemBuilder: (BuildContext context, int index) => new Container(
                  height: _heights.elementAt(index),
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text((index + 1).toString()),
                      ),
                    )),
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
            Container(
              height: 80,
            ),
          ],
        ),
      ],
    );
  }

  /*
  @override
  initState() {
    super.initState();

    /// 스테이크
    _displays.add(Display(26, 1, [5, 8, 26], [], [], 13));
  }
  */

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
