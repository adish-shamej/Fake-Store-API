import 'package:fake_store/responsive_layouts/mobile/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class newDrawer extends StatefulWidget {
  const newDrawer({Key? key}) : super(key: key);

  @override
  State<newDrawer> createState() => _newDrawerState();
}

class _newDrawerState extends State<newDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Image.asset("assets/images/splash.jpeg")),
          const ListTile(
            leading: Icon(Iconsax.user),
            title: Text("U S E R"),
          ),
          const ListTile(
            leading: Icon(Iconsax.shopping_cart),
            title: Text("C A R T"),
          ),
          const ListTile(
            leading: Icon(Iconsax.category),
            title: Text("C A T E G O R I E S"),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              FirebaseAuth.instance.signOut();
              SharedPreferences userData =
                  await SharedPreferences.getInstance();
              await userData.clear();
              print("logout");
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const Login(),
                ),
                (route) => false,
              );
            },
            leading: const Icon(Iconsax.logout),
            title: const Text("L O G O U T"),
          ),
        ],
      ),
    );
  }
}
