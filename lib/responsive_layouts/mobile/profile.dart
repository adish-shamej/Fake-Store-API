import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> docIDs = [];

  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection('users');
  //
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   print("```````````");
  //   print(allData);
  // }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String myId = '';
  String myUsername = '';
  String myUrlAvatar = '';

  // void _getdata() async {
  //   User user = _firebaseAuth.currentUser;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.uid)
  //       .snapshots()
  //       .listen((userData) {
  //
  //     setState(() {
  //       myId = userData.data()['uid'];
  //       myUsername = userData.data()['name'];
  //       myUrlAvatar = userData.data()['avatarurl'];
  //
  //     });
  //     )};

  // @override
  // void initState(){
  //   super.initState()
  // }
  Future<void> getUserData() async {
    User? user = _firebaseAuth.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user?.uid)
        .snapshots()
        .listen((userData) {
      setState(() {
        myId = userData.data()!['uid'];
        myUsername = userData.data()!['name'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            return Text(myUsername.toString());
            // return ListView.builder(
            //   itemCount: docIDs.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text("docIDs"),
            //     );
            //   },
            // );
          },
        ));
  }

  list(int index) {
    return Text("");
  }
}
