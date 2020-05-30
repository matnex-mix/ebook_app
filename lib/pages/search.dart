import 'package:ebook_app/widgets/appbar.dart';
import 'package:ebook_app/widgets/lister.dart';
import 'package:ebook_app/widgets/search-options.dart';
import 'package:ebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';

import '../values.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var results = [];
  var keyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar( context, 'Search For Book', <Widget>[
          IconButton(
            icon: Icon( Icons.settings ),
            onPressed: (){
              showSearchOption(context);
            },
          ),
        ],),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border.all( color: Colors.grey ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: textField(keyword, 'Search Keyword...', TextInputType.text),
          ),
          SizedBox(height: 20),
          Lister(),
        ]
      ),
    );
  }
}