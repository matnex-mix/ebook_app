import 'package:ebook_app/values.dart';
import 'package:flutter/material.dart';

class SearchOptions extends StatefulWidget {
  @override
  _SearchOptionsState createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.4),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: (MediaQuery.of(context).size.height-370)/2,
            left: 20,
            height: 370,
            width: MediaQuery.of(context).size.width-40,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Column(children: <Widget>[
                Text( 'Search Options', style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Agency FB', fontSize: 19.0 ) ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        
                      ],
                    ),
                  ),
                ),
              ],)
            ),
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
          ),
        ]
      ),
    );
  }
}

void showSearchOption( context ){
  showDialog(
    context: context,
    builder: (context) => SearchOptions(),
  );
}