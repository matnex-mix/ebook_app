import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ebook_app/models/model.dart';

import 'values.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ebook 101',
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Loading();
  }

  Future<Timer> Loading() async {
    return Timer(Duration(seconds: 8), onDoneLoading);
  }

  onDoneLoading() async {
    if( !Models.internetConnected() ) {
      //Models.navigateReplace(context, 'notconnected');
    } else if( !Models.loggedIn() ) {
      Models.navigateReplace(context, 'login');
    } else {
      //Models.navigateReplace(context, 'home');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: App.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical( bottom: Radius.elliptical(40, 10) ),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 366.0,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Image.asset('assets/img/splash-bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 366.0,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                    child: Text(
                        '"reading is a necessity in life, the more you read the more you gain"',
                        softWrap: true,
                        style: TextStyle( fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white ),
                      //),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/img/giphy.gif', height: 100.0,),
                    SizedBox(height: 10.0,),
                    Text(
                      App.title,
                      style: TextStyle(fontSize: 17.0, color: Colors.white),
                    ),
                    Text(
                      'loading...',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 12.0),
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}