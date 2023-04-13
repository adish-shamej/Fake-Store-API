import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatefulWidget {
  final String orderId;
  final String orderTotal;

  OrderPlacedScreen({required this.orderId, required this.orderTotal});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  var uid;
  final FirebaseAuth _ath = FirebaseAuth.instance;

  @override
  void initState() {
    final User? user = _ath.currentUser;
    setState(() {
      uid = user!.uid;
    });

    super.initState();
  }

  void clearUserData() {
    final DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('carts').child(uid);
    userRef.remove().then((_) {
      print('User data cleared successfully');
    }).catchError((error) {
      print('Failed to clear user data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Placed',
          style: TextStyle(fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 100.0,
                color: Colors.green,
              ),
              SizedBox(height: 16.0),
              Text(
                'Order Placed!',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  clearUserData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MobileScaffol()),
                  );
                },
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.blue, // Set button color to blue
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderPlacedScreen(
      orderId: '123456789',
      orderTotal: '\$100.00',
    ),
    theme: ThemeData(
      primaryColor: Colors.blue, // Set primary color to blue
    ),
  ));
}
