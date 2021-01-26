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
  Widget _buildPage(TextEditingController _nameController) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 155,
            child: Column(
              children: <Widget>[
                Container(
                  height: 65,
                  width: 65,
                  margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
                  child: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.black,
                    size: 65,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '고마운분 ',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        width: 17,
                        height: 17,
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.info_outline_rounded,
                            size: 17,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  width: 250,
                  height: 35,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.black12,
                    ),
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.indigo,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Colors.black12,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Colors.black12,
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        suffixIcon: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.clear,
                            color: Colors.black26,
                            size: 15,
                          ),
                          onPressed: () {
                            _nameController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return Container(
      child: CupertinoButton(
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context, null);
        },
      ),
    );
  }

  List<Widget> _buildActions(TextEditingController _nameController) {
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
        onPressed: () {
          Navigator.pop(context, _nameController.text);
        },
      ),
    ));

    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController =
        new TextEditingController(text: widget.user.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        toolbarHeight: 46,
        title: Text('내 정보 수정'),
        leading: _buildLeading(),
        actions: _buildActions(_nameController),
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      body: _buildPage(_nameController),
    );
  }
}
