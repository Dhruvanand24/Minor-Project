import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.deepPurple[300],
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'MealsApp',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.circle,
              size: 20,
              color: Colors.purple[900],
            ),
            title: Text(
              'My Profile',
              style: TextStyle(
                color: Colors.deepPurple[300],
                fontSize: 20,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.circle,
              size: 20,
              color: Colors.purple[900],
            ),
            title: Text(
              'option 2',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[300],
              ),
            ),
            onTap: () {
              //...
            },
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 20,
              color: Colors.purple[900],
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[300],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, './loginpage');
            },
          )
        ],
      ),
    );
  }
}
