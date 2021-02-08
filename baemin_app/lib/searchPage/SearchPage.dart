import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../Ranking.dart';
import 'SearchPageRankHigh.dart';
import 'SearchPageRankLow.dart';
import 'SearchPageTitle.dart';

/// *****************************************************************
/// 버그있음.
/// 검색기록이 보이는 상태에서 아래로 끝까지 갔다가 올라오면 검색기록이 보이지 않는다.
/// Stream이 null일 경우를 정해주어서 발생한다.
/// 일단은 수동으로 setState((){}) 를 사용하는 쪽으로 변경했다.
/// *****************************************************************

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  StreamController<bool> _cancelButtonStreamController =
      new StreamController.broadcast();
  StreamController<bool> _searchHistoryStreamController =
      new StreamController.broadcast();
  FocusNode _searchFocusNode = new FocusNode();

  bool _visibleHistory = false;

  List<String> _searchHistory = new List<String>();
  List<Ranking> _rankingList = [
    Ranking(
      name: '배스킨라빈스',
      info: 1,
    ),
    Ranking(
      name: '와플',
      info: 1,
    ),
    Ranking(
      name: '곱창',
      info: 1,
    ),
    Ranking(
      name: '파리바게뜨',
      info: 1,
    ),
    Ranking(
      name: '명량핫도그',
      info: 1,
    ),
    Ranking(
      name: '던킨도너츠',
      info: 1,
    ),
    Ranking(
      name: '마카롱',
      info: 1,
    ),
    Ranking(
      name: '와플대학',
      info: 1,
    ),
    Ranking(
      name: '핫도그',
      info: 1,
    ),
    Ranking(
      name: '닭발',
      info: 1,
    ),
    Ranking(
      name: '크로플',
      info: 2,
    ),
    Ranking(
      name: '떡볶이',
      info: 1,
    ),
    Ranking(
      name: '아이스크림',
      info: 1,
    ),
    Ranking(
      name: '타코야끼',
      info: 1,
    ),
    Ranking(
      name: '케이크',
      info: 1,
    ),
    Ranking(
      name: '회',
      info: 1,
    ),
    Ranking(
      name: '도넛',
      info: 1,
    ),
    Ranking(
      name: '노랑통닭',
      info: 1,
    ),
    Ranking(
      name: '메가커피',
      info: 2,
    ),
    Ranking(
      name: '설빙',
      info: 2,
    ),
  ];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.white,
      keyboardSeparatorColor: Colors.black26,
      nextFocus: false,
      actions: <KeyboardActionsItem>[
        KeyboardActionsItem(
          focusNode: _searchFocusNode,
          displayArrows: false,
          toolbarButtons: [
            (node) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    node.unfocus();
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  String _returnTime() {
    DateTime _now = DateTime.now();

    return formatDate(_now, [mm, '.', dd, ' ', HH, ':00 기준']);
  }

  Widget _buildSearchBar() {
    TextEditingController _searchController = new TextEditingController();

    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: _searchController,
              focusNode: _searchFocusNode,
              keyboardType: TextInputType.text,
              cursorColor: Colors.indigo,
              cursorHeight: 20,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: '메뉴명, 가게명 검색',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              ),
              onChanged: (String string) {
                if (string.length == 0) {
                  _cancelButtonStreamController.add(false);
                } else {
                  _cancelButtonStreamController.add(true);
                }
              },
              onSubmitted: (String string) {
                print('Submitted : ' + string);
                _searchHistory.add(string);
                _searchController.clear();
                //_searchHistoryStreamController.add(true);
                setState(
                  () {
                    _visibleHistory = true;
                  },
                );
                _cancelButtonStreamController.add(false);
              },
            ),
          ),
          Container(
            width: 30,
            child: StreamBuilder(
              stream: _cancelButtonStreamController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.data) {
                  return Container(
                    width: 1,
                    height: 1,
                  );
                } else {
                  return IconButton(
                    icon: Icon(Icons.cancel),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.black26,
                    onPressed: () {
                      _searchController.clear();
                      _cancelButtonStreamController.add(false);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage() {
    double _leftMargin = 15;

    return Container(
      color: Colors.white,
      child: KeyboardActions(
        config: _buildConfig(context),
        tapOutsideToDismiss: false,
        child: ListView(
          children: <Widget>[
            Visibility(
              /// 검색기록
              visible: _visibleHistory, //snapshot.data ?? true,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 10,
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  Container(
                    color: Colors.white,
                    height: 107,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SearchPageTitle(
                              title: '최근 검색어',
                              leftMargin: _leftMargin,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0x09000000),
                              ),
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '전체삭제',
                                  textScaleFactor: 0.82,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  _searchHistory.clear();
                                  //_searchHistoryStreamController.add(false);
                                  setState(
                                    () {
                                      _visibleHistory = false;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          /// 검색기록
                          height: 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _searchHistory.length + 2,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0 ||
                                  index == _searchHistory.length + 1) {
                                return Container(
                                  width: 20,
                                );
                              } else {
                                return Container(
                                  width: (_searchHistory
                                              .elementAt(
                                                  _searchHistory.length - index)
                                              .length *
                                          11.0) +
                                      30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 239, 250, 250),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          _searchHistory.elementAt(
                                              _searchHistory.length - index),
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Container(
                                        width: 15,
                                        child: CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: Icon(
                                            Icons.clear,
                                            size: 15,
                                          ),
                                          onPressed: () {
                                            _searchHistory.removeAt(
                                                _searchHistory.length -
                                                    index);
                                            if(_searchHistory.isEmpty) {
                                              _visibleHistory = false;
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Color(0x1F000000),
                  ),
                ],
              ),
            ),
            /*
            StreamBuilder(
              stream: _searchHistoryStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return Visibility(
                  /// 검색기록
                  visible: snapshot.data ?? true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      Container(
                        color: Colors.white,
                        height: 107,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SearchPageTitle(
                                  title: '최근 검색어',
                                  leftMargin: _leftMargin,
                                ),
                                Container(
                                  height: 25,
                                  width: 70,
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0x09000000),
                                  ),
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    child: Text(
                                      '전체삭제',
                                      textScaleFactor: 0.82,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      _searchHistory.clear();
                                      _searchHistoryStreamController.add(false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _searchHistory.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child:
                                        Text(_searchHistory.elementAt(index)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0x1F000000),
                      ),
                    ],
                  ),
                );
              },
            ),
             */
            Stack(
              /// 실시간 랭킹 제목
              children: <Widget>[
                Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  child: Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 95,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 25,
                              ),
                              SearchPageTitle(
                                leftMargin: _leftMargin,
                                title: '가장 많이',
                              ),
                              SearchPageTitle(
                                leftMargin: _leftMargin,
                                title: '검색하고 있어요',
                              ),
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(_leftMargin, 1, 0, 0),
                                child: Text(
                                  _returnTime(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  /// 사진이 조금더 내려가야함.
                  right: 14,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/Search/deco_popular_search.png'),
                  ),
                ),
              ],
            ),
            Column(
              /// 실시간 랭킹 내용
              children: List.generate(
                _rankingList.length,
                (int index) {
                  return Container(
                    height: 55,
                    color: Colors.white,
                    child: (index < 3)
                        ? SearchPageRankHigh(
                            rank: index + 1,
                            name: _rankingList.elementAt(index).name,
                            info: _rankingList.elementAt(index).info,
                          )
                        : SearchPageRankLow(
                            rank: index + 1,
                            name: _rankingList.elementAt(index).name,
                            info: _rankingList.elementAt(index).info,
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _cancelButtonStreamController.close();
    _searchHistoryStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          toolbarHeight: 46,
          elevation: 0.0,
          title: _buildSearchBar(),
        ),
        body: _buildPage(),
      ),
    );
  }
}
