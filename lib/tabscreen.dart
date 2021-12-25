import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:minorproject/maindrawer.dart';

import './favourites.dart';
import './cart.dart';
import './homepage.dart';
import './subscription.dart';

class Tabsmanagement extends StatefulWidget {
  @override
  _TabsmanagementState createState() => _TabsmanagementState();
}

class _TabsmanagementState extends State<Tabsmanagement> {
  final screens = [
    HomePage(),
    cart(),
    Subscription(),
    Favourites(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.add_shopping_cart_outlined, size: 30),
      Icon(Icons.calendar_today, size: 30),
      Icon(Icons.favorite, size: 30),
    ];
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'MealsApp',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MainDrawer(),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
          color: Colors.white,
        )),
        child: CurvedNavigationBar(
          color: Colors.deepPurple[300],
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.purple[900],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          height: 60,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
