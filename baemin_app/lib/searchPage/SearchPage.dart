import 'dart:async';
import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../Ranking.dart';
import 'SearchPageRankHigh.dart';
import 'SearchPageRankLow.dart';
import 'SearchPageTitle.dart';

/// ****************************************************************************
/// 버그있음.
/// 검색기록이 보이는 상태에서 아래로 끝까지 갔다가 올라오면 검색기록이 보이지 않는다.
/// 화면이 새로 빌드 되는듯
/// 일단은 수동으로 setState((){}) 를 사용하는 쪽으로 변경했다.
///
/// 검색한 문자열의 길이가 0 일때 검색버튼이 비활성화 되는 기능 필요
/// 임시로 문자열의 길이가 0 일때 검색기록에 안남도록 해야할듯
/// ****************************************************************************

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key key,
    this.scrollStreamController,
  }) : super(key: key);

  final StreamController<bool> scrollStreamController;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final double _toolbarHeight = 46; // 앱바 높이
  final double _keyboardActionHeight = 45.25; // 키보드 액션 높이
  final double _leftMargin = 15; // 페이지 왼쪽 마진

  StreamController<bool> _cancelButtonStreamController =
      new StreamController.broadcast(); // 검색창에 전체 지우기 버튼 stream

  TextEditingController _searchController =
      new TextEditingController(); // 검색창 text controller

  FocusNode _searchFocusNode = new FocusNode();

  List<String> _searchHistory = new List<String>(); // 검색기록들을 저장 할 리스트
  bool _visibleHistory = false; // 검색기록 보일 것인지 판별하는 변수
  bool _searchResult = false; // 검색결과창을 보여 줄 것인지 판별하는 변수

  ///*********************** 오버레이 관련 변수 *************************************

  OverlayEntry _overlayEntry;
  OverlayState _overlayState;
  bool _visibleOverlay = false; // 오버레이를 보일 것인지 판별하는 변수

  ///*********************** 데이터 **********************************************

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

  ///*********************** 오버레이 관련 함수 *************************************

  /// 오버레이 초기 설정 메서드
  void _initSearchSuggestOverlay(BuildContext context) {
    _overlayState = Overlay.of(context);
  }

  /// 오버레이를 보이게 하는 메서드
  void _showSearchSuggestOverlay() {
    _visibleOverlay = true;

    _overlayEntry = _buildSearchSuggestOverlayEntry();

    _overlayState.insert(_overlayEntry);
  }

  /// 오버레이를 숨기는 메서드
  void _removeSearchSuggestOverlay() {
    _visibleOverlay = false;

    _overlayEntry.remove();
  }

  /// 오버레이를 빌드하는 메서드
  OverlayEntry _buildSearchSuggestOverlayEntry() {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceRealHeight =
        _deviceHeight - MediaQuery.of(context).padding.top - _toolbarHeight;
    final _deviceWidth = MediaQuery.of(context).size.width;
    final double _contentHeight = 50; // 50

    Random _random = new Random();
    int _nextNum = 1 + _random.nextInt(14); // 1 ~ 15 사이의 숫자

    return OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) {
        return Positioned(
          bottom:
              MediaQuery.of(context).viewInsets.bottom + _keyboardActionHeight,
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
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _nextNum,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: _contentHeight,
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            padding: EdgeInsets.fromLTRB(_leftMargin, 0, 0, 0),
                            height: _contentHeight,
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
                            onPressed: () {
                              _searchHistory.add('인덱스 ${index + 1}');
                              _searchFocusNode.unfocus();
                              _searchController.text = '인덱스 ${index + 1}';
                              setState(
                                () {
                                  _visibleHistory = true;
                                  _searchResult = true;
                                  _removeSearchSuggestOverlay();
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  /*Scaffold(
                    resizeToAvoidBottomPadding: false,
                    extendBodyBehindAppBar: true,
                    extendBody: true,
                    body:
                  ),*/
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///*********************** 키보드액션 관련 함수 ***********************************

  /// 키보드 액션을 설정하는 메서드
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
                        _removeSearchSuggestOverlay();
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

  ///*********************** 페이지 빌드 관련 함수 **********************************

  /// 현재 시간을 기준으로 분이 00인 시간을 반환하는 메서드
  String _returnTime() {
    DateTime _now = DateTime.now();

    return formatDate(_now, [mm, '.', dd, ' ', HH, ':00 기준']);
  }

  /// 앱바 빌드 메서드
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
                    setState(
                      () {
                        _removeSearchSuggestOverlay();
                        _showSearchSuggestOverlay();
                      },
                    );
                  } else {
                    setState(
                      () {
                        _showSearchSuggestOverlay();
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
                  setState(
                    () {
                      _visibleHistory = true;
                      _searchResult = true;
                      _removeSearchSuggestOverlay();
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
                          _removeSearchSuggestOverlay();
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

  /// 결과 페이지 빌드 메서드
  Widget _buildResultPage() {
    /// 나중에 내용을 넣을 경우, ListView 의 controller 를 StreamBuilder 를 써서 만들 것.
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

  /// 일반 페이지 빌드 메서드
  Widget _buildPage() {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: widget.scrollStreamController.stream,
        initialData: false,
        builder: (BuildContext buildContext, AsyncSnapshot<bool> snapshot) {
          return KeyboardActions(
            config: _buildConfig(context),
            child: ListView(
              controller: snapshot.data
                  ? PrimaryScrollController.of(context)
                  : ScrollController(),
              children: <Widget>[
                Visibility(
                  /// 검색기록
                  visible: _visibleHistory,
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
                                  int _lifoIndex =
                                      _searchHistory.length - index;

                                  if (index == 0) {
                                    return Container(
                                      width: 20,
                                    );
                                  } else if (index ==
                                      _searchHistory.length + 1) {
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
                                            color: Color.fromARGB(
                                                255, 239, 250, 250),
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                                        _searchHistory.removeAt(
                                                            _lifoIndex);
                                                        _searchHistory.add(
                                                            _searchController
                                                                .text);
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
                                                    if (_searchHistory
                                                        .isEmpty) {
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
                                    margin: EdgeInsets.fromLTRB(
                                        _leftMargin, 1, 0, 0),
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
                        child: Image.asset(
                            'assets/Search/deco_popular_search.png'),
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
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    widget.scrollStreamController.sink.add(false);
    _initSearchSuggestOverlay(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _cancelButtonStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: _toolbarHeight,
          title: _buildTitle(),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScroll) {
            overScroll.disallowGlow();
            return;
          },
          child: (_searchResult) ? _buildResultPage() : _buildPage(),
        ),
      ),
    );
  }
}
