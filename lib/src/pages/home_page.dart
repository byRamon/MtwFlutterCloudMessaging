import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Home',
      home: CupertinoPageScaffold(
        child: Center(child: Text('Hola mundo'),),
      ),
    );
  }
}