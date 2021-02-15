import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OverlayEntry _searchSuggestOverlayEntry;
  OverlayState _overlay;
  bool _visibleOverlay = false;

  OverlayEntry _createSearchSuggestOverlayEntry() {
    int _searchSuggestLength = 5;

    return OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).padding.top + 46,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top + 46),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Positioned(
                height: (30.0 * _searchSuggestLength >
                        MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).padding.top + 46))
                    ? MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).padding.top + 46)
                    : 30.0 * _searchSuggestLength,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  child: Scaffold(
                    body: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero, // to remove SafeArea
                        itemCount: _searchSuggestLength,
                        itemBuilder: (BuildContext context, int index) {
                          print(index);
                          return Container(
                            height: 30,
                            child: Text(index.toString()),
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
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _overlay = Overlay.of(context);
    //_overlay2 = Overlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        toolbarHeight: 46,
        title: Text(
          '홈',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('show'),
            onPressed: () {
              if (!_visibleOverlay) {}
              _searchSuggestOverlayEntry = _createSearchSuggestOverlayEntry();

              setState(
                () {
                  _overlay.insert(_searchSuggestOverlayEntry);
                  _overlay.setState(() {});
                  _visibleOverlay = true;
                },
              );
            },
          ),
          FlatButton(
            child: Text('hide'),
            onPressed: () {
              if (_visibleOverlay) {}
              setState(
                () {
                  _searchSuggestOverlayEntry.remove();
                  _visibleOverlay = false;
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
