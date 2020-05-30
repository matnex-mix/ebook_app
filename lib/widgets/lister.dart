import 'package:flutter/material.dart';

import 'package:ebook_app/models/model.dart';
import '../values.dart';

class Lister extends StatefulWidget {
  @override
  _ListerState createState() => new _ListerState();
}

class _ListerState extends State<Lister> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: ( context, index ){
          index++;
          return InkWell(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                        child: Image.asset('assets/img/book_$index.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Text( 'Book @$index is now for sale', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16.0 ), overflow: TextOverflow.ellipsis, ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text( '\$10.50', style: TextStyle( fontWeight: FontWeight.w600, fontSize: 19.0 ), overflow: TextOverflow.ellipsis, ),
                        ),
                        Icon( Icons.star, color: App.primaryColor, size: 13, ),
                        Text( '4.8', style: TextStyle( fontWeight: FontWeight.w500, fontSize: 15.0 ), ),
                      ]                    
                    )
                  ]
                )
              ),
            ),
            onTap: (){
              Models.navigate(context, 'book');
            },
          );
        },
        
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8)
      ),
    );
  }
}