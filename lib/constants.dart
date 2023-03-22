import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

var defBgColor = Colors.white70;

var myAppBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
);

var myDrawer = Drawer(
  child: Column(
    children: [
      DrawerHeader(
          child: Icon(
        Icons.favorite,
        color: Colors.black,
      )),
      ListTile(
        leading: Icon(Iconsax.user),
        title: Text("U S E R"),
      ),
      ListTile(
        leading: Icon(Iconsax.shopping_cart),
        title: Text("C A R T"),
      ),
      ListTile(
        leading: Icon(Iconsax.category),
        title: Text("C A T E G O R I E S"),
      ),
      Spacer(),
      ListTile(
        onTap: () async {
          // FirebaseAuth.instance.signOut();
          // SharedPreferences userData = await SharedPreferences.getInstance();
          // await userData.clear();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SecondRoute()),
          // );
        },
        leading: Icon(Iconsax.logout),
        title: Text("L O G O U T"),
      ),
    ],
  ),
);

h(double h) {
  return SizedBox(height: h);
}

w(double w) {
  return SizedBox(width: w);
}
