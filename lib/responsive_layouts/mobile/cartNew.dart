import 'package:fake_store/constants.dart';
import 'package:fake_store/responsive_layouts/mobile/newCheckout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CartNew extends StatefulWidget {
  const CartNew({Key? key}) : super(key: key);

  @override
  State<CartNew> createState() => _CartNewState();
}

class _CartNewState extends State<CartNew> {
  var uid;
  final FirebaseAuth _ath = FirebaseAuth.instance;

  @override
  void initState() {
    final User? user = _ath.currentUser;
    setState(() {
      uid = user!.uid;
    });
    getData();
    super.initState();
  }

  void getData() {
    FirebaseDatabase.instance
        .ref()
        .child("carts")
        .once()
        .then((DatabaseEvent snapshot) async {
      print(snapshot);
    });
  }

  // final Query  _chat = FirebaseDatabase.instance.ref().child("carts").child(uid)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FirebaseAnimatedList(
          query: FirebaseDatabase.instance
              .ref()
              .child('carts')
              .child(uid.toString()),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return chhat(snapshot.value, index);
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreenNew()),
              );
            },
            child: Text("Checkout")),
      ),
    );
  }

  chhat(var value, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Image.network(
              value["itemImage"].toString(),
              height: 60,
              width: 60,
            ),
            w(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value["itemName"],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Text(
                    value["itemPrice"] + " USD",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
