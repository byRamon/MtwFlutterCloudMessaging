import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_messaging/src/providers/push_notifications_provider.dart';
import 'package:cloud_messaging/src/pages/home_page.dart';
import 'package:cloud_messaging/src/pages/mensaje_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushProvider = PushNotificationProvider();
    pushProvider.initiNotifications();
    pushProvider.mensajes.listen((data) { 
      print('Argumento $data');
      navigatorKey.currentState.pushNamed('mensaje', arguments: data);
    });
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorKey: navigatorKey,
      title: 'Material App',
      home: CupertinoPageScaffold(
        child: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'mensaje' : (BuildContext context) => MensajePage(),
      },
    );
  }
}