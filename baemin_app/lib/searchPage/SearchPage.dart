import 'dart:async';
import 'dart:math';

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
/// 화면이 새로 빌드 되는듯
/// 일단은 수동으로 setState((){}) 를 사용하는 쪽으로 변경했다.
///
/// 검색한 문자열의 길이가 0 일때 검색버튼이 비활성화 되는 기능 필요
/// 임시로 문자열의 길이가 0 일때 검색기록에 안남도록 해야할듯
/// *****************************************************************

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final double _toolbarHeight = 46;
  final double _keyboardActionHeight = 45.25;
  final double _leftMargin = 15;

  OverlayEntry _searchSuggestOverlayEntry;
  OverlayState _overlay;

  StreamController<bool> _cancelButtonStreamController =
      new StreamController.broadcast();

  TextEditingController _searchController = new TextEditingController();

  /*
  StreamController<bool> _searchHistoryStreamController =
      new StreamController.broadcast();
   */
  FocusNode _searchFocusNode = new FocusNode();

  bool _visibleHistory = false;
  bool _searchResult = false;
  bool _visibleOverlay = false;

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

  OverlayEntry _createSearchSuggestOverlayEntry() {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceRealHeight =
        _deviceHeight - MediaQuery.of(context).padding.top - _toolbarHeight;
    final _deviceWidth = MediaQuery.of(context).size.width;
    final double _contentHeight = 50.0;

    Random _random = new Random();
    int _nextNum = 1 + _random.nextInt(9); // 1 ~ 10 사이의 숫자

    return OverlayEntry(
        maintainState: true,
        builder: (BuildContext context) {
          return Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                _keyboardActionHeight,
            width: _deviceWidth,
            height: _deviceRealHeight -
                MediaQuery.of(context).viewInsets.bottom -
                _keyboardActionHeight,
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  height: (_contentHeight * _nextNum >
                          _deviceRealHeight -
                              MediaQuery.of(context).viewInsets.bottom -
                              _keyboardActionHeight)
                      ? _deviceRealHeight -
                          MediaQuery.of(context).viewInsets.bottom -
                          _keyboardActionHeight
                      : _contentHeight * _nextNum,
                  width: _deviceWidth,
                  child: Material(
                    child: Scaffold(
                      resizeToAvoidBottomPadding: false,
                      body: Container(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: _nextNum,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: _contentHeight,
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
                                padding: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        ' 인덱스 ${index + 1}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

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
            (FocusNode focusNode) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    focusNode.unfocus();
                    setState(
                      () {
                        _visibleOverlay = false;
                        _searchSuggestOverlayEntry.remove();
                      },
                    );
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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

  Widget _buildTitle() {
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          Visibility(
            visible: _searchResult,
            child: Container(
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(
                    () {
                      _searchResult = false;
                      _searchController.clear();
                      _cancelButtonStreamController.sink.add(false);
                      _searchFocusNode.unfocus();
                    },
                  );
                },
              ),
            ),
          ),
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
                contentPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
              ),
              onChanged: (String string) {
                if (string.length == 0) {
                  _cancelButtonStreamController.sink.add(false);
                } else {
                  _cancelButtonStreamController.sink.add(true);

                  if (_visibleOverlay) {
                    _searchSuggestOverlayEntry.remove();
                    _searchSuggestOverlayEntry =
                        _createSearchSuggestOverlayEntry();
                    setState(
                      () {
                        _overlay.insert(_searchSuggestOverlayEntry);
                      },
                    );
                  } else {
                    _visibleOverlay = true;
                    _searchSuggestOverlayEntry =
                        _createSearchSuggestOverlayEntry();
                    setState(
                      () {
                        _overlay.insert(_searchSuggestOverlayEntry);
                        _overlay.setState(() {});
                      },
                    );
                  }
                }
              },
              onSubmitted: (String string) {
                print('Submitted : ' + string);
                if (string.length == 0) {
                  /* do nothing */
                } else {
                  _searchHistory.add(string);
                  //_searchController.clear();
                  //_searchHistoryStreamController.add(true);
                  setState(
                    () {
                      _visibleHistory = true;
                      _searchResult = true;
                      _visibleOverlay = false;
                      _searchSuggestOverlayEntry.remove();
                    },
                  );
                }
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
                      _cancelButtonStreamController.sink.add(false);

                      setState(
                        () {
                          _visibleOverlay = false;
                          _searchSuggestOverlayEntry.remove();
                        },
                      );

                      FocusScope.of(context).requestFocus(_searchFocusNode);
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

  Widget _buildResultPage() {
    return Container(
      child: KeyboardActions(
        config: _buildConfig(context),
        tapOutsideToDismiss: false,
        child: Center(
          child: Text(
            '${_searchHistory.last} 의 결과화면',
          ),
        ),
      ),
    );
  }

  Widget _buildPage() {
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
                                    fontSize: 17,
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
                          height: 50,
                          padding: EdgeInsets.fromLTRB(0, 13, 0, 5),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _searchHistory.length + 2,
                            itemBuilder: (BuildContext context, int index) {
                              int _lifoIndex = _searchHistory.length - index;

                              if (index == 0) {
                                return Container(
                                  width: 20,
                                );
                              } else if (index == _searchHistory.length + 1) {
                                return Container(
                                  width: 15,
                                );
                              } else {
                                print(_searchHistory
                                    .elementAt(_lifoIndex)
                                    .length);
                                return Row(
                                  children: <Widget>[
                                    Container(
                                      width: (_searchHistory
                                                  .elementAt(_lifoIndex)
                                                  .length *
                                              12.0) +
                                          40,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 239, 250, 250),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            //alignment: Alignment.center,
                                            child: CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              minSize: 0,
                                              child: Text(
                                                _searchHistory
                                                    .elementAt(_lifoIndex),
                                                textScaleFactor: 0.82,
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 42, 193, 188),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    _searchResult = true;
                                                    _cancelButtonStreamController
                                                        .sink
                                                        .add(true);
                                                    _searchController.text =
                                                        _searchHistory
                                                            .elementAt(
                                                                _lifoIndex);
                                                    _searchHistory
                                                        .removeAt(_lifoIndex);
                                                    _searchHistory.add(
                                                        _searchController.text);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 15,
                                            child: CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              child: Icon(
                                                Icons.clear,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 42, 193, 188),
                                              ),
                                              onPressed: () {
                                                _searchHistory
                                                    .removeAt(_lifoIndex);
                                                if (_searchHistory.isEmpty) {
                                                  _visibleHistory = false;
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                  ],
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
  void initState() {
    super.initState();

    _overlay = Overlay.of(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _cancelButtonStreamController.close();
    //_searchHistoryStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          toolbarHeight: _toolbarHeight,
          elevation: 0.0,
          title: _buildTitle(),
        ),
        body: (_searchResult) ? _buildResultPage() : _buildPage(),
      ),
    );
  }
}
