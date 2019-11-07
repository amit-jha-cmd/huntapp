import 'package:flutter/material.dart';

import 'package:hunt/ui/home/home_page.dart';
import 'package:hunt/ui/login/loginPage.dart';
import 'package:hunt/ui/splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomePage(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
      },
      home:
      SplashScreen(),


    );
  }

}