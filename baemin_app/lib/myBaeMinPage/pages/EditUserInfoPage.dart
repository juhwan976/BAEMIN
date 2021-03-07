import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../User.dart';

///*****************************************************************************
///
/// my배민 페이지에서 내 정보 수정 페이지를 출력하는 위젯
///
///*****************************************************************************
///
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
                  /// 프로필 사진 변경
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
                  /// 사용자 이름 변경
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
          Container(
            height: 10,
            color: Color(0x09000000),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(TextEditingController _nameController) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 45, 0),
            child: CupertinoButton(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context, null);
              },
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                '내 정보 수정',
                textScaleFactor: 0.82,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
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
          ),
        ],
      ),
    );
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
        title: _buildTitle(_nameController),
        leading: null,
        automaticallyImplyLeading: false,
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
