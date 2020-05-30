import 'package:ebook_app/models/model.dart';
import 'package:ebook_app/widgets/appbar.dart';
import 'package:ebook_app/widgets/cartitem.dart';
import 'package:flutter/material.dart';

import '../values.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar( context, 'My Cart', <Widget>[
        ],),
        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  actionButton( Icons.delete_sweep, 'REMOVE', (){
                    for( String x in Models.cartSelectedItems ){
                      print( x );
                    }
                    Navigator.pop(context);
                  }),
                  SizedBox(width: 10.0,),
                  actionButton( Icons.add_box, 'CHECKOUT', (){
                    // increment or reduce quantity in cart
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget actionButton( icon, text, function ){
    return RaisedButton(
      color: App.primaryColor,
      textColor: Colors.white,
      child: Row(
        children: <Widget>[
          Icon( icon ),
          SizedBox(width: 10.0,),
          Text( text )
        ],
      ),
      onPressed: function,
    );
  }
}