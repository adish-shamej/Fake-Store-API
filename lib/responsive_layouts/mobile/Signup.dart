import 'package:fake_store/constants.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/authHelper.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
                    width: 300,
                    child: ElevatedButton(
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
                              setState(() {
                                setSharedPreference('LOGIN', "true");
                                tap = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MobileScaffol()));
                            } else {
                              setState(() {
                                tap = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  result,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ));
                            }
                          });
                        },
                        // onPressed: () async {
                        //   try {
                        //     //   setState(() {
                        //     //     tap = true;
                        //     //   });
                        //     UserCredential userCredential = await FirebaseAuth
                        //         .instance
                        //         .createUserWithEmailAndPassword(
                        //             email: _emailController.text,
                        //             password: _passController.text);
                        //
                        //     await FirebaseAuth.instance.currentUser!
                        //         .updateEmail(_emailController.text);
                        //     await FirestoreServices.saveUser(
                        //         _emailController.text, userCredential.user!.uid);
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //             content: Text('Registration Successful')));
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => const loggedIn()),
                        //     // );
                        //   }
                        //   // on FirebaseAuthException catch (e) {
                        //   //   print("qqqqq");
                        //   //
                        //   //   if (e.code == 'email-already-in-use') {
                        //   //     ScaffoldMessenger.of(context).showSnackBar(
                        //   //         const SnackBar(content: Text('Email Provided already Exists')));
                        //   //   }
                        //   // }
                        //   catch (e) {
                        //     print("bdhbhfsj");
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text(e.toString())));
                        //     // setState(() {
                        //     //   tap == false;
                        //     // });
                        //   }
                        // },
                        child: tap == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : const Text("SignUp")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
