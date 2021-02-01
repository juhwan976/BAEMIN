import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({
    Key key,
    @required int selectedIndex,
    @required this.compareIndex,
    @required this.normalIcon,
    @required this.selectedIcon,
    @required this.title,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;
  final int compareIndex;
  final String normalIcon;
  final String selectedIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          (_selectedIndex == compareIndex) ? selectedIcon : normalIcon,
          height: 30,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            title,
            textScaleFactor: 0.82,
            style: TextStyle(
              color: (_selectedIndex == compareIndex)
                  ? Color.fromARGB(255, 38, 193, 188)
                  : Color.fromARGB(255, 136, 136, 136),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
