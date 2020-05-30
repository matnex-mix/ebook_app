import 'dart:math';

import 'package:ebook_app/values.dart';
import 'package:flutter/material.dart';

Container myBlock( paddig, child ){
  return Container(
    padding: EdgeInsets.all( paddig ),
    color: App.primaryColor,
    child: child,
  );
}

Widget singleReview(){
  return Card( elevation: 4, child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/img/book_2.jpg'),
            ),
            SizedBox(width: 20.0,),
            Text(
              'Samuel Adeniyi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            Row(children: List.generate(5, (int index){
              var color = Colors.pink;
              if( index==4 ) {
                color = Colors.grey;
              }
              return Icon( Icons.star, color: color, size: 19, );
            }),),
            SizedBox(width: 15.0,),
            Text(
              '11/12/2019',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 50,
          child: InkWell(
            child: Text(
              '''To add custom fonts to your application, add a fonts section here, in this "flutter" section. Each entry in this list should have a list giving the asset and other descriptors for the font. For''',
              style: TextStyle(),
              //overflow: TextOverflow.ellipsis,
            ),
            onTap: (){
              // Show Full Text
            },
          ),
        ),
      ],
    ),
  ));
}

Container ratingWidget(){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              '4.3/5',
              style: TextStyle(fontSize: 40.0, color: Colors.pink),
            ),
            Text(
              '8 ratings'
            )
          ],
        ),
        SizedBox(width: 15.0,),
        Column(
          children: List.generate(5, (int index){
            var rate = Random().nextInt(80);
            return Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.pink, size: 20,),
                SizedBox(width: 3.0,),
                Text((5-index).toString()+' ($rate)', style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 15.0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.grey
                  ),
                  height: 10.0,
                  width: 100.0,
                  child: Container(
                    margin: EdgeInsets.only(right: 100.0-rate),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.pink
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    ),
  ); // Ratings
}

Container textField( controller, hintText, type ){
  return Container(
    height: 40.0,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: App.secondaryColor,
        filled: true,
        border: OutlineInputBorder( borderSide: BorderSide.none ),
        hintText: hintText,
        hintStyle: TextStyle( fontFamily: 'Agency FB', color: Colors.black, fontWeight: FontWeight.bold ),
        contentPadding: EdgeInsets.all(10),
      ),
      textAlignVertical: TextAlignVertical.center,
      obscureText: type==TextInputType.visiblePassword ? true : false,
      keyboardType: type
    ),
  );
}