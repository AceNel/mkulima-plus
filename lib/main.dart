import 'package:flutter/material.dart';

import 'splash_screen.dart ';
import 'auth.dart';
import 'root_page.dart';
var routes= <String,WidgetBuilder>{
    "/loginPage":( BuildContext context) => RootPage(auth: new Auth())
};


void main() => runApp(MaterialApp(
  title: 'Mkulima Plus',
  theme: ThemeData (
    primaryColor: Colors.redAccent,
accentColor: Colors.yellowAccent
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreenOne(),
  routes: routes,
));

