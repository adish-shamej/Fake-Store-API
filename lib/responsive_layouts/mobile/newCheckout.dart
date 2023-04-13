import 'package:fake_store/responsive_layouts/mobile/cardPaymentScreen.dart';
import 'package:fake_store/responsive_layouts/mobile/orderConfirmed.dart';
import 'package:flutter/material.dart';

class PaymentScreenNew extends StatelessWidget {
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              title: const Text(
                'Debit / Credit Cards',
                style: TextStyle(fontSize: 18.0),
              ),
              leading: const Icon(
                Icons.credit_card,
                size: 30.0,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardPaymentScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Cash on Delivery',
                style: TextStyle(fontSize: 18.0),
              ),
              leading: const Icon(
                Icons.money,
                size: 30.0,
              ),
              trailing: const Icon(
                Icons.check_circle,
                size: 20.0,
                color: Colors.green,
              ),
              onTap: () {
                // Handle cash on delivery payment
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Payment Confirmation'),
                      content: const Text(
                          'Please keep cash ready for payment on delivery.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentScreenNew(),
    theme: ThemeData(
      primaryColor: Colors.blue, // Set primary color to blue
      accentColor: Colors.blueAccent, // Set accent color to blue accent
    ),
  ));
}
