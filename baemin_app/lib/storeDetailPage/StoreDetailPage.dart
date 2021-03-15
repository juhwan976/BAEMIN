import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Store.dart';

class StoreDetailPage extends StatefulWidget {
  StoreDetailPage({
    Key key,
    this.store,
  }) : super(key: key);
  final Store store;

  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  Widget _buildLeading() {
    return Container(
      child: CupertinoButton(
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  List<Widget> _buildAction() {
    List<Widget> _widgetList = new List<Widget>();

    _widgetList.add(
      Container(
        child: FlatButton(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
    );

    return _widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            primary: true,
            pinned: true,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              widget.store.name,
              textScaleFactor: 0.82,
            ),
            leading: _buildLeading(),
            actions: _buildAction(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(index.toString()),
                    ),
                    Divider(),
                  ],
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}