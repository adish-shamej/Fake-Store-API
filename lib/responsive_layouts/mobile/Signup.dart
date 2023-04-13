import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_store/constants.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/authHelper.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  bool tap = false;
  bool locationTap = false;
  String? _currentAddress;
  Position? _currentPosition;

  Future<void> uploadingData(
      String _name, String _phone, String _address, String _email) async {
    await FirebaseFirestore.instance.collection("users").add(
        {'name': _name, 'phone': _phone, 'address': _address, 'email': _email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              tap = true;
            });
            AuthenticationHelper()
                .signUp(
                    email: _emailController.text,
                    password: _passController.text)
                .then((result) {
              if (result == null) {
                uploadingData(_nameController.text, _PhoneController.text,
                    _addressController.text, _emailController.text);
                setState(() {
                  setSharedPreference('LOGIN', "true");
                  setSharedPreference('EMAIL', _emailController.text);
                  tap = false;
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MobileScaffol()));
              } else {
                setState(() {
                  tap = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ));
              }
            });
          },
          label: tap == true
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white))
              : const Text("SignUp")),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text("Signup"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/564x/fe/e5/ea/fee5eab30a698c169dc4fd5752359c2c.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Name",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  h(10),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Email",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  h(10),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Password",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  h(10),
                  TextFormField(
                    controller: _PhoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Phone",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  h(10),
                  TextFormField(
                    controller: _addressController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      alignLabelWithHint: true,
                      labelText: "Address",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  h(10),
                  SizedBox(

                    child: ElevatedButton(
                      onPressed: () {
                        _getCurrentPosition();
                        setState(() {
                          locationTap = true;
                        });
                      },
                      child: locationTap == true
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                  color: Colors.white))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.my_location,
                                    color: Colors.white, size: 15),
                                w(10),
                                const Text("Get Your Current Location"),
                              ],
                            ),
                    ),
                  ),
                  h(10),
                  // SizedBox(
                  //   width: 300,
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           tap = true;
                  //         });
                  //         AuthenticationHelper()
                  //             .signUp(
                  //                 email: _emailController.text,
                  //                 password: _passController.text)
                  //             .then((result) {
                  //           if (result == null) {
                  //             uploadingData(
                  //                 _nameController.text,
                  //                 _PhoneController.text,
                  //                 _addressController.text,
                  //                 _emailController.text);
                  //             setState(() {
                  //               setSharedPreference('LOGIN', "true");
                  //               setSharedPreference(
                  //                   'EMAIL', _emailController.text);
                  //               tap = false;
                  //             });
                  //             Navigator.pushReplacement(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const MobileScaffol()));
                  //           } else {
                  //             setState(() {
                  //               tap = false;
                  //             });
                  //             ScaffoldMessenger.of(context)
                  //                 .showSnackBar(SnackBar(
                  //               content: Text(
                  //                 result,
                  //                 style: const TextStyle(fontSize: 16),
                  //               ),
                  //             ));
                  //           }
                  //         });
                  //       },
                  //       // onPressed: () async {
                  //       //   try {
                  //       //     //   setState(() {
                  //       //     //     tap = true;
                  //       //     //   });
                  //       //     UserCredential userCredential = await FirebaseAuth
                  //       //         .instance
                  //       //         .createUserWithEmailAndPassword(
                  //       //             email: _emailController.text,
                  //       //             password: _passController.text);
                  //       //
                  //       //     await FirebaseAuth.instance.currentUser!
                  //       //         .updateEmail(_emailController.text);
                  //       //     await FirestoreServices.saveUser(
                  //       //         _emailController.text, userCredential.user!.uid);
                  //       //     ScaffoldMessenger.of(context).showSnackBar(
                  //       //         const SnackBar(
                  //       //             content: Text('Registration Successful')));
                  //       //     // Navigator.push(
                  //       //     //   context,
                  //       //     //   MaterialPageRoute(
                  //       //     //       builder: (context) => const loggedIn()),
                  //       //     // );
                  //       //   }
                  //       //   // on FirebaseAuthException catch (e) {
                  //       //   //   print("qqqqq");
                  //       //   //
                  //       //   //   if (e.code == 'email-already-in-use') {
                  //       //   //     ScaffoldMessenger.of(context).showSnackBar(
                  //       //   //         const SnackBar(content: Text('Email Provided already Exists')));
                  //       //   //   }
                  //       //   // }
                  //       //   catch (e) {
                  //       //     print("bdhbhfsj");
                  //       //     ScaffoldMessenger.of(context).showSnackBar(
                  //       //         SnackBar(content: Text(e.toString())));
                  //       //     // setState(() {
                  //       //     //   tap == false;
                  //       //     // });
                  //       //   }
                  //       // },
                  //       child: tap == true
                  //           ? const SizedBox(
                  //               height: 20,
                  //               width: 20,
                  //               child: CircularProgressIndicator(
                  //                   color: Colors.white))
                  //           : const Text("SignUp")),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      setState(() {
        locationTap = false;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.name}, ${place.administrativeArea}, ${place.postalCode}';
        _addressController.text = _currentAddress.toString();
      });
      print(_currentAddress);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
