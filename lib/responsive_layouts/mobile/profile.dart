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
  var uid;
  var name;
  var phone;
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

  @override
  void initState() {
    super.initState();
    getData();
  }
  // Future<void> getUserData() async {
  //   User? user = _firebaseAuth.currentUser;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user?.uid)
  //       .snapshots()
  //       .listen((userData) {
  //     setState(() {
  //       myId = userData.data()!['uid'];
  //       myUsername = userData.data()!['name'];
  //     });
  //     print("```````````````");
  //     print(myId);
  //     print("```````````````");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text(name.toString()));
  }

  list(int index) {
    return const Text("");
  }

  // Future getMessagePathData() async {
  //   final User? user = _ath.currentUser;
  //   setState(() {
  //     uid = user!.uid;
  //   });
  //
  //   var dataa =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   Map<String, dynamic> userData = dataa as Map<String, dynamic>;
  //   setState(() {
  //     name = userData['name'];
  //   });
  //   print("`````````````````");
  //   print(name);
  //   print("`````````````````");
  //
  //   // setState(() {
  //   //   name = dataa.data()['name'];
  //   //   // name = dataa.name = snapshot.get('name');
  //   //   phone = snapshot.get('phone');
  //   // });
  // }

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    setState(() {
      uid = user!.uid;
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document ID: ${documentSnapshot.id}');
      } else {
        print('Document does not exist on the database');
      }
    });

    // try {
    //   DocumentSnapshot<Map<String, dynamic>> snapshot =
    //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
    //   if (snapshot.exists) {
    //     Map<String, dynamic> userData = snapshot.data()!;
    //     String name = userData['name'];
    //     String phoneNumber = userData['phone'];
    //     print('Name: $name');
    //     print('Phone Number: $phoneNumber');
    //   } else {
    //     print('User with ID $uid not found.');
    //   }
    // } catch (e) {
    //   print('Error getting user details: $e');
    // }

    // var vari =
    //     FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
    // Map<String, dynamic> userData = vari as Map<String, dynamic>;
    //
    // setState(() {
    //   name = userData['name'];
    // });
  }

  final FirebaseAuth _ath = FirebaseAuth.instance;

  Future inputData() async {
    final User? user = _ath.currentUser;
    setState(() {
      uid = user!.uid;
    });
  }
}
