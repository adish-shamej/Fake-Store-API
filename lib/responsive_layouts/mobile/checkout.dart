import 'package:fake_store/responsive_layouts/mobile/orderConfirmed.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _cashOnDelivery = false;

  void _toggleCashOnDelivery(bool value) {
    setState(() {
      _cashOnDelivery = value;
    });
  }

  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {
        _cashOnDelivery = checkBoxState;
      });
    }
  }

  void _submitPayment() {
    if (_cashOnDelivery) {
      // Perform payment logic here for Cash on Delivery
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Payment Successful',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Thank you for your payment!',
              style: TextStyle(fontSize: 18.0),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Handle other payment methods (e.g., online payment)
      // You can add more logic here based on your specific requirements
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderPlacedScreen(
                        orderId: "qqq",
                        orderTotal: "111",
                      )),
            );
          },
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 20.0),
          ),
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            Card(
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: _cashOnDelivery,
                      onChanged: checkBoxCallBack,
                    ),
                    const Text(
                      'Cash on Delivery',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
    theme: ThemeData(
      primaryColor: Colors.blue, // Set primary color to blue
    ),
  ));
}
