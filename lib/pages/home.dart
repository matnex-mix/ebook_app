import 'package:ebook_app/widgets/lister.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ebook_app/models/model.dart';
import '../values.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNav = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: App.primaryColor,
            title: Text( App.title ),
            leading: IconButton(
              icon: Icon( FontAwesomeIcons.bars ),
              iconSize: 19.0,
              onPressed: (){

              }
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon( FontAwesomeIcons.search ),
                iconSize: 18.0,
                onPressed: (){
                  Models.navigate(context, 'categories');
                }
              )
            ],
            bottom: TabBar(
              onTap: (int) {},
              tabs: [
                Tab(text: 'NEW BOOKS',),
                Tab(text: 'POPULAR', ),
                Tab(text: 'TOP BOOKS', ),
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: App.primaryColor,
            color: App.primaryColor,
            height: 50.0,
            index: 1,
            key: _bottomNav,
            items: <Widget>[
              InkWell(
                onTap: ()=>Navigator.pushNamed(context, '/favourites'),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Icon(
                FontAwesomeIcons.home,
                size: 20,
                color: Colors.white,
              ),
              Icon(
                Icons.library_books,
                size: 20,
                color: Colors.white,
              ),
              Icon(
                FontAwesomeIcons.solidUserCircle,
                size: 20,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              print(index);
            },
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Lister(),
              Lister(),
              Lister(),
            ],
          ),
        ),
      ),
    );
  }
}