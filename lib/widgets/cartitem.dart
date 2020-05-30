import 'package:ebook_app/models/model.dart';
import 'package:flutter/material.dart';

import '../values.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool selected = false;
  Color bgColor = Colors.white;
  var index;
  var key = GlobalKey();

  @override
  Widget build(context) {
    return InkWell( child: Container(
      color: bgColor,
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 100,
                      width: 90,
                      child: FittedBox(
                        child: Image.asset('assets/img/book_3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Pineapple Pizza', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 12.0,),
                        Container(
                          color: Colors.pink,
                          padding: EdgeInsets.all(6.0),
                          child: Text( '\$15.95', style: TextStyle( fontSize: 17.0, color: Colors.white ), ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Checkbox(
              value: selected,
              onChanged: (val){},
            ),
          ),
        ],
      ),
    ), onLongPress: (){
      setState(() {
        bgColor = App.primaryColor.withOpacity(0.7);
        selected = true;
        Models.cartSelectedItems.add( key.toString() );
        index = Models.cartSelectedItems.length-1;
      });
    }, onTap: (){
      if( selected==true ){
        setState(() {
          selected = false;
          bgColor = Colors.white;
          Models.cartSelectedItems.removeAt( index );
        });
      } else if( Models.cartSelectedItems.length > 0 ){
        setState(() {
          bgColor = App.primaryColor.withOpacity(0.7);
          selected = true;
          Models.cartSelectedItems.add( key.toString() );
          index = Models.cartSelectedItems.length-1;
        });
      }
    },);
  }

  Widget controlButton( text, function ){
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: App.primaryColor,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18), textAlign: TextAlign.center,),
      ),
      onTap: function,
    );
  }
}