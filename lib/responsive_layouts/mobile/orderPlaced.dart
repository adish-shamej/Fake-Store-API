import 'package:fake_store/responsive_layouts/mobile/OrderList.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  final pic;
  final title;
  final price;
  const OrderPlaced({Key? key, this.pic, this.title, this.price})
      : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
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
        title: const Text("Orders Succesful"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_rounded,
              color: Colors.blue,
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
            Text("Your order has been placed!",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            SizedBox(height: 10),

            Text("Order will be delivered within 4 days.",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => MobileScaffol()),
                  //     (Route<dynamic> route) => false);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OrdreList(
                              pic: widget.pic,
                              title: widget.title,
                              price: widget.price)));
                },
                child: const Text("Go to my orders"),
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
