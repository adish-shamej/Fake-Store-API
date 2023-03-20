import 'package:fake_store/responsive_layouts/desktop_scaffold.dart';
import 'package:fake_store/responsive_layouts/mobile/HomePage.dart';
import 'package:fake_store/responsive_layouts/mobile/Login%20Page.dart';
import 'package:fake_store/responsive_layouts/mobile/OrderList.dart';
import 'package:fake_store/responsive_layouts/mobile/Signup.dart';

import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/responsive_layouts/mobile/orderPlaced.dart';

import 'package:fake_store/responsive_layouts/responsive_layout.dart';
import 'package:fake_store/responsive_layouts/tablet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Store API',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      // home: const RespLayouts(
      //     mobileScaffold: MobileScaffol(),
      //     tabScaffold: TabletScaffold(),
      //     desktopScaffold: DesktopScaffold()),
    );
  }
}
