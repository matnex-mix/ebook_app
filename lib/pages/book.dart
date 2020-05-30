import 'package:ebook_app/widgets/reviews.dart';
import 'package:ebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/models/model.dart';
import 'package:ebook_app/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../values.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => new _BookState();
}

class _BookState extends State<Book> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar( context, 'Book @ Something', <Widget>[
          IconButton(
            icon: Icon( Icons.add_shopping_cart ),
            onPressed: (){
              Models.navigate(context, 'cart');
            }
          ),
        ],),
        body: ListView(
          children: <Widget>[
            Container(
              height: 212,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Image.asset('assets/img/book_2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: App.successColor,
                      child: Text( '\$24.19', style: TextStyle( fontSize: 27, fontFamily: 'corbel', fontWeight: FontWeight.w600, color: Colors.white ), )
                    ),
                  )
                ],
              )
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.all(10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon( FontAwesomeIcons.leaf, color: App.primaryColor, size: 25, ),
                      SizedBox(width: 10.0,),
                      Text(
                        '200\nPages',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    color: Color(0xFF424242),
                  ),
                  Row(
                    children: <Widget>[
                      Icon( FontAwesomeIcons.star, color: App.primaryColor, size: 25, ),
                      SizedBox(width: 10.0,),
                      Text(
                        '4.3 (2.1K)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    color: Color(0xFF424242),
                  ),
                  Row(
                    children: <Widget>[
                      Icon( FontAwesomeIcons.bookReader, color: App.primaryColor, size: 25, ),
                      SizedBox(width: 10.0,),
                      Text(
                        '1k',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    color: Color(0xFF424242),
                  ),
                  Row(
                    children: <Widget>[
                      Icon( Icons.done, color: App.primaryColor, size: 25.0 ),
                      SizedBox(width: 10.0,),
                      Text(
                        '232\nOrders',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              color: App.secondaryColor,
              child: Row(
                children: <Widget>[
                  Text( 'Description', style: TextStyle( fontSize: 19 ), ),
                  Icon( Icons.chevron_right, color: App.primaryColor, )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text( '''To add custom fonts to your application, add a fonts section here, in this "flutter" section. Each entry in this list should have a''', softWrap: true, style: TextStyle( fontFamily: 'calibri' ), )
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon( FontAwesomeIcons.userTie, size: 19.0, color: App.successColor ),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Author', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          SizedBox(height: 4.0,),
                          Text('Muhamad Bn Jabal, Ash-shaoty', style: TextStyle(fontStyle: FontStyle.italic),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon( FontAwesomeIcons.print, size: 19.0, color: App.successColor ),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Publisher', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          SizedBox(height: 4.0,),
                          Text('Amal Books', style: TextStyle(fontStyle: FontStyle.italic),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon( FontAwesomeIcons.calendarDay, size: 19.0, color: App.successColor ),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          SizedBox(height: 4.0,),
                          Text('Semptember 4, 2019', style: TextStyle(fontStyle: FontStyle.italic),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 20.0),
              color: App.secondaryColor,
              child: Row(
                children: <Widget>[
                  Text( 'Preface', style: TextStyle( fontSize: 19 ), ),
                  Icon( Icons.chevron_right, color: App.primaryColor, )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text( '''To add custom fonts to your application, add a fonts section here,\
  # in this "flutter" section. Each entry in this list should have a\
  # "family" key with the font family name, and a "fonts" key with a\
  # list giving the asset and other descriptors for the font. For, To add custom fonts to your application, add a fonts section here,\
  # in this "flutter" section. Each entry in this list should have a\
  # "family" key with the font family name, and a "fonts" key with a\
  # list giving the asset and other descriptors for the font. For''', softWrap: true, style: TextStyle( fontFamily: 'calibri' ), )
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: App.primaryColor
              ),
              child: Row(children: <Widget>[
                Expanded(
                  child: Column(children: <Widget>[
                    Text( 'Continue Reading', style: TextStyle( fontSize: 19.0, color: Colors.white ), ),
                    SizedBox(height: 4),
                    Text( 'you\'re finding this book interesting?', style: TextStyle( fontSize: 14.0, color: Colors.white, fontStyle: FontStyle.italic ), ),
                  ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  textColor: Colors.white,
                  color: App.successColor,
                  child: Text('view all'),
                  onPressed: (){

                  },
                ),
              ],),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: App.secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text( 'Reviews & Ratings', style: TextStyle(fontSize: 19,), ),
                  InkWell(
                    child: Icon( Icons.arrow_forward ),
                    onTap: (){
                      showFullReviews(context);
                    },
                  ),
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  ratingWidget(),
                  SizedBox(height: 30.0,),
                  Container(
                    child: Column(
                      children: List.generate(3, (int index){
                        return singleReview();
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
          ]
        ),
      ),
    );
  }
}