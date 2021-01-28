import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({
    Key key,
    @required this.fromAnotherPage,
  }) : super(key: key);

  final bool fromAnotherPage;

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  Widget _buildLeading() {
    if (widget.fromAnotherPage) {
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
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        toolbarHeight: 46,
        leading: _buildLeading(),
        centerTitle: true,
        title: Text('주문내역'),
      ),
      body: Center(
        child: Text('주문내역'),
      ),
    );
  }
}
