import 'package:fake_store/responsive_layouts/mobile/Login%20Page.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:flutter/material.dart';

import 'Signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://1.bp.blogspot.com/-d3naBjwfrSE/VHVRNle-CLI/AAAAAAAAACo/2ADzqat6xR4/s1600/shopping-cart-1920.jpg"),
              fit: BoxFit.cover),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: const Text("Signup")),
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
