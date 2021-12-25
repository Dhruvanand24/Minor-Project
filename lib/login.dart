import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import './tabscreen.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFBddb343);
  double windowWidth = 0;
  double windowHeight = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _regYOffset = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  double _headingTop = 100;
  double _loginHeight = 0;
  double _registerHeight = 0;
  bool _keyboardvisible = false;
  bool _hider = true;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController names = TextEditingController();

  Future register() async {
    if (email.text == null || pass.text == null || names.text == "") {
      Fluttertoast.showToast(
          msg: 'please enter email and password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var url = Uri.parse('http://192.168.29.207/mealsapp/register.php');
      var response = await http.post(url, body: {
        "email": email.text,
        "pass": pass.text,
        "names": names.text,
      });

      var data = jsonDecode(response.body);
      if (data == "error") {
        Fluttertoast.showToast(
            msg: 'This user already exist!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[300],
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        setState(() {
          Fluttertoast.showToast(
              msg: 'Signed up!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green[300],
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushReplacementNamed(context, './tabs');
        });
        Fluttertoast.showToast(
            msg: 'Signed up!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green[300],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future login() async {
    var url = Uri.parse('http://192.168.29.207/mealsapp/login.php');
    var response = await http.post(url, body: {
      "email": email.text,
      "pass": pass.text,
    });

    var data = jsonDecode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: 'Logged in!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green[300],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        Navigator.pushReplacementNamed(context, './tabs');
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Incorrect email id or password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardvisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFBddb343);
        _loginYOffset = windowHeight;
        _loginHeight = _keyboardvisible ? windowHeight : windowHeight - 270;
        _regYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 100;
        break;
      case 1:
        _backgroundColor = Color(0xFFBddb343);
        _headingColor = Colors.white;
        _loginYOffset = _keyboardvisible ? 90 : 270;
        _loginHeight = _keyboardvisible ? windowHeight : windowHeight - 270;
        _regYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 90;
        break;
      case 2:
        _backgroundColor = Color(0xFFBddb343);
        _headingColor = Colors.white;
        _loginYOffset = _keyboardvisible ? 30 : 240;
        _loginHeight = _keyboardvisible ? windowHeight : windowHeight - 240;
        _regYOffset = _keyboardvisible ? 70 : 270;
        _registerHeight = _keyboardvisible ? windowHeight : windowHeight - 270;
        _loginXOffset = 20;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _headingTop = 80;

        break;
    }
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 1],
                  colors: [Colors.purple[900], Colors.white])),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1000),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            'Welcome!',
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Text(
                            '"Healthy and delcious food at your doorstep."',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(child: Image.asset("assets/images/5.png")),
              ),
              Container(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    if (_pageState != 0) {
                      _pageState = 0;
                    } else
                      _pageState = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(40),
                  padding: EdgeInsets.all(17),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              )),
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(25),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Login to continue.",
                      style: TextStyle(fontSize: 22, color: Colors.purple[900]),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Icon(
                              Icons.email_rounded,
                              size: 20,
                              color: Colors.black26,
                            )),
                        Expanded(
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Enter Email'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Icon(
                              Icons.vpn_key_rounded,
                              size: 20,
                              color: Colors.black26,
                            )),
                        Expanded(
                          child: TextField(
                            controller: pass,
                            obscureText: _hider,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Enter Password'),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_hider == true) {
                                  _hider = false;
                                } else
                                  _hider = true;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black26,
                            )),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        login();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purple[900], Colors.purple[200]]),
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineButton(
                      btnTxt: "Create new account",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _regYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a new account",
                      style: TextStyle(fontSize: 18, color: Colors.purple[900]),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Icon(
                              Icons.account_circle_sharp,
                              size: 20,
                              color: Colors.black26,
                            )),
                        Expanded(
                          child: TextField(
                            controller: names,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Enter Name'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Icon(
                              Icons.email_rounded,
                              size: 20,
                              color: Colors.black26,
                            )),
                        Expanded(
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Enter Email'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Icon(
                              Icons.vpn_key_rounded,
                              size: 20,
                              color: Colors.black26,
                            )),
                        Expanded(
                          child: TextField(
                            controller: pass,
                            obscureText: _hider,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Enter Password'),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_hider == true) {
                                  _hider = false;
                                } else
                                  _hider = true;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black26,
                            )),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        register();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purple[900], Colors.purple[200]]),
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Create account',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          _pageState = 1;
                        },
                      );
                    },
                    child: OutlineButton(
                      btnTxt: "Back to Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnTxt;
  PrimaryButton({this.btnTxt});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.pushReplacementNamed(context, './tabs');
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple[900], Colors.purple[200]]),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            widget.btnTxt,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {
  final String btnTxt;
  OutlineButton({this.btnTxt});

  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple[900], Colors.purple[200]]),
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnTxt,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
