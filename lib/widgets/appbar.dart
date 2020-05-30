import 'package:ebook_app/values.dart';
import 'package:flutter/material.dart';

AppBar myAppBar( context, String title, actions ){
  return AppBar(
    leading: IconButton(
      icon: Icon( Icons.arrow_back ),
      onPressed: (){
        Navigator.pop(context);
      }
    ),
    title: Text(title),
    actions: actions,
    backgroundColor: App.primaryColor,
  );
}