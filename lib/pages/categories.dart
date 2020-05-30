import 'package:ebook_app/data/provider.dart';
import 'package:ebook_app/models/model.dart';
import 'package:ebook_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../data/categories.dart';
import '../values.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar( context, 'Select Category', <Widget>[
        ],),
      body: ListView(
        children: List.generate( categoryList.length, (index){
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border( bottom: BorderSide(color: App.secondaryColor) )
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(children: <Widget>[
                Icon( categoryList[index]['icon'] ),
                SizedBox(width: 25.0),
                Text( categoryList[index]['text'], style: TextStyle( fontSize: 16 ), ),
              ],),
            ),
            splashColor: App.primaryColor,
            onTap: (){
              Provider.searchOptions['tag'] = categoryList[index]['text'];
              Models.navigateReplace(context, 'search');
            },
          );
        }),
      ),
    );
  }
}