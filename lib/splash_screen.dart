import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenOne extends StatefulWidget {

  @override
  _SplashScreenOneState createState() =>  _SplashScreenOneState();
}
class _SplashScreenOneState extends State<SplashScreenOne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5 ), () => Navigator.pushNamed(context, "/loginPage"));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 75.0,
                        child: Icon(
                          Icons.local_florist,
                          color: Colors.green,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),

                      ),
                      Text(
                        'Mkulima Plus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Online Market Place for Everyone",
                        style: TextStyle(color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}