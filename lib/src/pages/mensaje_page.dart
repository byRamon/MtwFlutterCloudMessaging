import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  const MensajePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    return CupertinoApp(
      title: 'Mensaje',
      home: CupertinoPageScaffold(
        child: Center(child: Text(arg),),
      ),
    );
  }
}