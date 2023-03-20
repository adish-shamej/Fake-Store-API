import 'package:fake_store/responsive_layouts/mobile/OrderList.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';

class OrderCancel extends StatefulWidget {
  final pic;
  final title;
  final price;
  const OrderCancel({Key? key, this.pic, this.title, this.price})
      : super(key: key);

  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    var ttt = await getSharedPreference(ID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Orders Cancelled"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.close,
              color: Colors.red,
              size: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.network(
                  widget.pic.toString(),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text("Your order has been cancelled!",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MobileScaffol()),
                      (Route<dynamic> route) => false);

                },
                child: const Text("Go to Home screen"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
