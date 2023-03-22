import 'dart:async';

import 'package:fake_store/responsive_layouts/mobile/Login.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    this._loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/splash.jpeg"),
            ),
          ),
          Positioned(
            child: CircularProgressIndicator(),
            bottom: 60,
            left: MediaQuery.of(context).size.width * 0.45,
            right: MediaQuery.of(context).size.width * 0.45,
          )
        ],
      ),
    );
  }

  _loadWidget() async {
    var token = await getSharedPreference(LOGIN);
    print("````````token````````");
    print(token);
    print("````````token````````");
    return Timer(Duration(seconds: 2),
        token.toString() == "null" ? navigationLogin : navigationHome);
  }

  void navigationHome() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MobileScaffol()));
  }

  void navigationLogin() {
    print("login");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}
