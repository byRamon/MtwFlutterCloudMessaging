import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  dispose(){
    _mensajesStreamController.close();
  }

  initiNotifications(){
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then( (token) {
      print('FCM Token -> $token');
      //ejCdZyz-qKM:APA91bE_LwqgSommQlzlKfS-HskFyrR08UATEg_gjXcDy2z2F-HWSg_GMZI-HKAk1Zl8LHajWxZj1x8jAVbCShJo4FC60q2mJT38x3B0byBM4-b7qNt_VCF65JF6yKiUlMWFiRdSmTiv
    });
    _firebaseMessaging.configure(
      onMessage: (data) {
        print('onMessage -> $data');
        String arg = 'no-data';
        if(Platform.isAndroid)
          arg = data['data']['mensaje'];
        else 
          arg = data['mensaje'] ?? 'no-data';
        _mensajesStreamController.sink.add(arg);
        
      },
      onLaunch: (data) {
        print('onLaunch -> $data');
      },
      onResume: (data) {
        print('onResume -> $data');
        String arg = 'no-data';
        if(Platform.isAndroid)
          arg = data['data']['mensaje'];
        else 
          arg = data['mensaje'] ?? 'no-data';
        _mensajesStreamController.sink.add(arg);
      },
    );
  }
}