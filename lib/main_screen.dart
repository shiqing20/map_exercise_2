import 'package:flutter/material.dart';

import 'main_appbar.dart';
import 'main_body.dart';
import 'main_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _iconSize = 300;
  Color _iconColor = Colors.amber;
  bool _allowResize = true;
  bool _allowChangePrimerColor = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
          iconSize: _iconSize,
          onSizeChange: (newSize) {
            setState(() {
              _iconSize = (newSize < 50)
                  ? 50
                  : (newSize > 500)
                      ? 500
                      : newSize;
            });
          },
          allowResize: _allowResize,
        ),
        body: MainBody(
          iconSize: _iconSize.toDouble(),
          iconColor: _iconColor,
        ),
        bottomNavigationBar: MainBottomBar(),
      ),
    );
  }
}
