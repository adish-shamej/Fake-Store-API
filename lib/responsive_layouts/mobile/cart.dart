// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class CartItem extends StatefulWidget {
//   String itemId;
//   String itemName;
//   double itemPrice;
//   CartItem(
//       {Key? key,
//       required this.itemId,
//       required this.itemName,
//       required this.itemPrice})
//       : super(key: key);
//
//   @override
//   State<CartItem> createState() => _CartItemState();
// }
//
// class _CartItemState extends State<CartItem> {
//   Stream<List<CartItem>> fetchCartItemsRealtime() {
//     DatabaseReference cartReference =
//         FirebaseDatabase.instance.ref().child('carts');
//
//     // Use onValue event listener to listen for changes in the cart data
//     return cartReference.onValue.map((event) {
//       List<CartItem> cartItems = [];
//       if (event.snapshot.value != null) {
//         // Convert the cart item data to CartItem objects
//         Map<dynamic, dynamic>? cartItemsMap =
//             event.snapshot.value as Map<dynamic, dynamic>?;
//         if (cartItemsMap != null) {
//           cartItemsMap.forEach((key, value) {
//             CartItem cartItem = CartItem(
//               itemId: value['itemId'],
//               itemName: value['itemName'],
//               itemPrice: value['itemPrice'].toDouble(),
//             );
//             cartItems.add(cartItem);
//           });
//         }
//       }
//       return cartItems;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<CartItem>>(
//       stream: fetchCartItemsRealtime(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           List<CartItem>? cartItems = snapshot.data;
//           return ListView.builder(
//             itemCount: cartItems!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(cartItems[index].itemName),
//                 subtitle: Text('Price: \$${cartItems[index].itemPrice}'),
//               );
//             },
//           );
//         } else {
//           return Text('No cart items found.');
//         }
//       },
//     );
//   }
// }
