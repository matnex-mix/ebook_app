import 'package:flutter/material.dart';
import 'package:ebook_app/models/model.dart';
import '../values.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FittedBox(
                child: Image.asset('assets/img/login-bg.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(1),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 90.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 25.0, color: App.primaryColor, fontWeight: FontWeight.bold ),
                        ),
                      ),
                      SizedBox(height: 7.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'welcome user, please sign in to continue',
                          style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        height: 40.0,
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            filled: true,
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        height: 40.0,
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            border: OutlineInputBorder()
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      FlatButton (
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: App.primaryColor,
                            borderRadius: BorderRadius.all( Radius.circular(20.0) )
                          ),
                          child: Text('LOGIN'),
                        ),
                        onPressed: (){
                          Models.navigateReplace(context, 'home');
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded( child: Container( height: 1, color: Color(0xff444444), ) ),
                              SizedBox( width: 10, ),
                              Text( 'OR', style: TextStyle( color: Color(0xff444444), fontSize: 18.0 ), ),
                              SizedBox( width: 10, ),
                              Expanded( child: Container( height: 1, color: Color(0xff444444), ) ),
                            ],
                          ),
                      ),
                      Column(
                        children: <Widget>[
                          InkWell(
                            child: Text(
                              'forgot password?',
                              style: TextStyle(fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.w600),
                            ),
                            onTap: (){
                              Models.navigate(context, 'forgot_password');
                            },
                          ),
                          SizedBox(height: 10.0),
                          InkWell(
                            child: Text(
                              'don\'t have account',
                              style: TextStyle(fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.w600),
                            ),
                            onTap: (){
                              Models.navigate(context, 'sign_in');
                            },
                          ),
                        ]
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        )
      )
    );
  }
}