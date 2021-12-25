import 'package:flutter/material.dart';
import 'package:minorproject/login.dart';

class AltLoginScreen extends StatefulWidget {
  @override
  _AltLoginScreenState createState() => _AltLoginScreenState();
}

class _AltLoginScreenState extends State<AltLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage());
  }
}
