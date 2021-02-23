import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'pages/Call.dart';
import 'pages/Rightnow.dart';
import 'pages/ZZimed.dart';

class ZZimPage extends StatefulWidget {
  ZZimPage({
    Key key,
    this.scrollBehaviorSubject,
    @required this.fromAnotherPage,
  }) : super(key: key);

  final BehaviorSubject<bool> scrollBehaviorSubject;
  final bool fromAnotherPage;

  @override
  _ZZimPageState createState() => _ZZimPageState();
}

class _ZZimPageState extends State<ZZimPage> with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tabTitleList = new List<Widget>();

  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: widget.fromAnotherPage,
            child: Container(
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                '찜한가게',
                textScaleFactor: 0.82,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.fromAnotherPage,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.transparent,
                size: 24,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  void _onTaped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _tabTitleList.add(Text('찜한가게', textScaleFactor: 0.82));
    _tabTitleList.add(Text('바로결제', textScaleFactor: 0.82));
    _tabTitleList.add(Text('전화주문', textScaleFactor: 0.82));

    _tabController = new TabController(
      initialIndex: 0,
      length: _tabTitleList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _deviceRealHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: _buildTitle(),
        backgroundColor: Colors.white,
        toolbarHeight: (Platform.isIOS) ? _deviceRealHeight * 0.109375 : 100,
        // 84, 안드로이드일 경우 높이는 임시
        elevation: 0.0,
        brightness: Brightness.light,
        bottom: PreferredSize(
          preferredSize: null,
          child: Theme(
            data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: Column(
              children: <Widget>[
                TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3.5,
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.all(5),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  unselectedLabelColor: Colors.black12,
                  tabs: _tabTitleList,
                  onTap: _onTaped,
                ),
                Container(
                  height: 1.0,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
          return;
        },
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ZZimed(buildContext: context, scrollBehaviorSubject: widget.scrollBehaviorSubject),
            Rightnow(buildContext: context, scrollBehaviorSubject: widget.scrollBehaviorSubject),
            Call(buildContext: context, scrollBehaviorSubject: widget.scrollBehaviorSubject),
          ],
        ),
      ),
    );
  }
}
