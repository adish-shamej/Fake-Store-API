import 'package:fake_store/controllers/data_controller.dart';
import 'package:fake_store/responsive_layouts/mobile/cancel%20Order.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class OrdreList extends StatefulWidget {
  final pic;
  final title;
  final price;
  const OrdreList({Key? key, this.title, this.price, this.pic})
      : super(key: key);

  @override
  State<OrdreList> createState() => _OrdreListState();
}

class _OrdreListState extends State<OrdreList> {
  Future<void> dattaaa() async {
    var getDat = DataController();
    setState(() {
      getDat.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: const Text("My Orders"),
        leading: const Icon(Icons.arrow_back),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MobileScaffol()),
                      (Route<dynamic> route) => false);
                },
                child: Text("Go to Home Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => OrderCancel(pic: widget.pic, title: widget.title, price: widget.price,)),
                  (Route<dynamic> route) => false);


            }, child: Text("Cancel Order"))
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: 1,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final itemdata = itemController.dataModels[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  widget.pic,
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title.toString()),
                      Text(widget.price.toString()),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  var testImg =
      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60";
}
