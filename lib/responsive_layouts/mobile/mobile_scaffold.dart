import 'dart:async';

import 'package:fake_store/controllers/data_controller.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/utils/newDrawer.dart';
import 'package:fake_store/utils/tiles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MobileScaffol extends StatefulWidget {
  const MobileScaffol({super.key});

  @override
  State<MobileScaffol> createState() => _MobileScaffolState();
}

class _MobileScaffolState extends State<MobileScaffol> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  bool isListView = true;

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Future<void> _refreshHandler() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    var getDat = DataController();

    setState(() {
      getDat.getData();
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          dismissDirection: DismissDirection.down,
          backgroundColor: Colors.green[100],
          content: const Text(
            'Refresh complete',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          // action: SnackBarAction(
          //   textColor: Colors.red[700],
          //   label: 'RETRY?',
          //   onPressed: () {
          //     _refreshIndicatorKey.currentState!.show();
          //   },
          // ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(DataController());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Center(
            child: Neumorphic(
          style: const NeumorphicStyle(
              lightSource: LightSource.top,
              boxShape: NeumorphicBoxShape.stadium()),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Fake Store",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800]),
              ),
            ),
          ),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 14, top: 14),
              child: NeumorphicButton(
                tooltip: "Menu",
                onPressed: () {
                  if (_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    _scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                provideHapticFeedback: true,
                style: NeumorphicStyle(
                    depth: 5,
                    surfaceIntensity: 0.3,
                    intensity: 0.8,
                    lightSource: LightSource.topLeft,
                    shadowLightColor: Colors.white.withOpacity(0.6),
                    color: Colors.white,
                    shape: NeumorphicShape.convex,
                    boxShape: const NeumorphicBoxShape.circle()),
                child: Icon(
                  Icons.menu_open_outlined,
                  color: Colors.grey[800],
                  size: 30,
                ),
              )),
        ],
      ),
      drawer: newDrawer(),
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 1500,
        animSpeedFactor: 2,
        color: Colors.transparent,
        showChildOpacityTransition: false,
        key: _refreshIndicatorKey,
        onRefresh: _refreshHandler,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white70.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
              child: Obx(() {
                return itemController.loading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: itemController.dataModels.length,
                        itemBuilder: (context, index) {
                          final itemdata = itemController.dataModels[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItemDetailsView(
                                          titlee: itemdata.title.toString(),
                                          productId: itemdata.id,
                                          description:
                                              itemdata.description.toString(),
                                          image: itemdata.image.toString(),
                                          price: itemdata.price.toString(),
                                          rating:
                                              itemdata.rating!.rate.toString(),
                                          category:
                                              itemdata.category.toString(),
                                        )));
                              },
                              child: MyTiles(
                                  image: itemdata.image.toString(),
                                  title: itemdata.title.toString(),
                                  price: itemdata.price.toString(),
                                  rate: itemdata.rating!.rate.toString()),
                            ),
                          );
                        });
              })),
        ),
      ),
    );
  }
}
