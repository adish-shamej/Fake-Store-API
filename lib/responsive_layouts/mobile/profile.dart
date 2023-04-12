import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_store/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance;

  var uid;
  var name;
  var phone;
  final user = FirebaseAuth.instance.currentUser;

  // Future getDocIDs() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((element) {
  //             print(element.reference);
  //             docIDs.add(element.reference.id);
  //           }));
  // }

  _fetch() async {
    final currentUser = FirebaseAuth.instance;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: currentUser.currentUser!.email)
        .snapshots();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String myId = '';
  String myUsername = '';
  String myUrlAvatar = '';

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/noDp.png", height: 80),
                            h(15),
                            Text(
                              "Name : " + data["name"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            h(10),
                            Text(
                              "Phone : " + data["phone"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            h(10),
                            Text(
                              "Email : " + data["email"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            h(10),
                            Text(
                              "Address : " + data["address"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            h(10),
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  list(int index) {
    return const Text("");
  }

  final FirebaseAuth _ath = FirebaseAuth.instance;

  Future inputData() async {
    final User? user = _ath.currentUser;
    setState(() {
      uid = user!.uid;
    });
  }
}
