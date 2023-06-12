import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_web/main.dart';

class AppRestartHelper {
  static Future<void> restartApp(BuildContext context) async {
    // await clearData();
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    await Future.delayed(Duration(milliseconds: 100));
    runApp(MyApp());
  }
}
