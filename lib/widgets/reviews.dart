import 'package:ebook_app/values.dart';
import 'package:ebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';

void showFullReviews(context){
  showDialog(
    context: context,
    builder: (BuildContext context) => Reviews()
  );
}

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  var reviews = <Widget>[];

  @override
  void initState(){
    reviews = List.generate(10, (i){
      return singleReview();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            height: 470,
            left: 0, right: 0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical( top: Radius.elliptical( 50, 25 ), )
              ),
              child: ListView(
                padding: EdgeInsets.all(5.0),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    color: App.secondaryColor,
                    child: Row(
                      children: <Widget>[
                        Text( 'Reviews & Ratings', style: TextStyle(fontSize: 19,), ),
                        Icon( Icons.chevron_right, color: App.primaryColor, ),
                      ]
                    ),
                  ),
                  ratingWidget(),
                  Column(
                    children: reviews,
                  ),
                  FlatButton(
                    child: Text( 'Load More', style: TextStyle( color: App.primaryColor ), ),
                    onPressed: (){
                      setState(() {
                        reviews.add( singleReview() );
                      });
                    },
                  ),
                ]
              ),
            )
          ),
          Positioned(
            right: 0,
            bottom: 470,
            width: 40,
            height: 40,
            child: IconButton(
              icon: Icon( Icons.cancel, size: 28, ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}