import 'dart:async';
import 'dart:convert';

import 'package:ebook_app/pages/book.dart';
import 'package:ebook_app/pages/cart.dart';
import 'package:ebook_app/pages/categories.dart';
import 'package:ebook_app/pages/home.dart';
import 'package:ebook_app/pages/search.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebook_app/pages/login.dart';

class Models {
  static var index = 0;
  static var post = {'id': '', 'title': ''};
  static var apiKey = '';
  static var apiLink = 'http://192.168.43.103/PetabyteProjects/panic_alert';
  static var session = {
    'timestamp': '',
    'auth_id': ''
  };

  static var cartSelectedItems = [];

  static bool loggedIn() {
    if( session['auth_id']!='' )
      return true;
    else
      return false;
  }
  static bool internetConnected() {
    return true;
  }
  static postState( int indexSub ) {
    index = indexSub;
  }

  static Future<String> postFile( url, files ) async {
    var request = new http.MultipartRequest("POST", Uri.parse('${Models.apiLink}/?api_key='+apiKey+url));
    for( int file_in=0;file_in<files.length;file_in++ ) {
      String file = files[file_in];
      var mimetype = lookupMimeType(file, headerBytes: [0xFF, 0xD8]).split('/');
      request.files.add(await http.MultipartFile.fromPath(
          'image$file_in',
          file,
          contentType: MediaType(
            mimetype[0],
            mimetype[1]
          ),
      ));
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      return '';
    }
  }

  static Future<EndPoint> fetchData( url ) async {
    apiKey = Models.md5(((((new DateTime.now().millisecondsSinceEpoch/1000).floor())/60).floor()+2).toString());
    if(loggedIn()) {
      apiKey = session['auth_id'];
    }
    final response = await http.get('${Models.apiLink}/?api_key='+apiKey+url);
    // print((((new DateTime.now().millisecondsSinceEpoch/1000).floor())).floor());
    // print(response.body);
  
    if (response.statusCode == 200) {
      return EndPoint.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static String md5(String input) {
    return crypto.md5.convert(utf8.encode(input)).toString();
  }

  static var routes = {
    "login": Login(),
    "home": Home(),
    "book": Book(),
    "cart": Cart(),
    'search': Search(),
    'categories': Categories(),
  };

  static void navigate( context, route ) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => routes[route]
    ));
  }

  static void navigateReplace( context, route ) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => routes[route]
    ));
  }
  
}

class EndPoint {
  Map<String, dynamic> data;
  List<dynamic> errors;
  int error;

  EndPoint({this.data, this.errors, this.error});

  factory EndPoint.fromJson(Map<String, dynamic> json) {
    return EndPoint (
      data: json['data'],
      errors: json['errors'],
      error: json['error'],
    );
  }
}