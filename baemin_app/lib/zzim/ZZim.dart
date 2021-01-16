import 'package:flutter/material.dart';

import 'pages/Call.dart';
import 'pages/Rightnow.dart';
import 'pages/ZZimed.dart';

class ZZimPage extends StatefulWidget {
  ZZimPage({Key key}) : super(key: key);

  @override
  _ZZimPageState createState() => _ZZimPageState();
}

class _ZZimPageState extends State<ZZimPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 84.0,
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
                children: <Widget> [
                  TabBar(
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
                    tabs: [
                      Theme(
                        data: ThemeData(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                        child: Text('찜한가게'),
                      ),
                      Text('바로결제'),
                      Text('전화주문'),
                    ],
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
          title: Text('찜한가게'),
        ),
        body: TabBarView(
          children: <Widget>[
            ZZimed(),
            Rightnow(),
            Call(),
          ],
        ),
      ),
    );
  }
}
