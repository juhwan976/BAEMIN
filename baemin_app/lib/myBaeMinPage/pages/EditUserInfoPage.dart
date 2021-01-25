import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../User.dart';

class EditUserInfoPage extends StatefulWidget {
  const EditUserInfoPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  _EditUserInfoPageState createState() => _EditUserInfoPageState();
}

class _EditUserInfoPageState extends State<EditUserInfoPage> {
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

  List<Widget> _buildActions() {
    List<Widget> _listWidget = new List<Widget>();

    _listWidget.add(Container(
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Text(
          '저장',
          textScaleFactor: 0.82,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.normal,
          ),
        ),
        onPressed: () {},
      ),
    ));

    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        toolbarHeight: 46,
        title: Text('내 정보 수정'),
        leading: _buildLeading(),
        actions: _buildActions(),
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      body: Center(
        child: Text('widget.user.name : ${widget.user.name}'),
      ),
    );
  }
}
