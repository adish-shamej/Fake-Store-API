import 'package:fake_store/responsive_layouts/mobile/Login%20Page.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: const Text("Signup Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: passController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Addresss',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: PhoneController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phonenumber',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.length != 0 &&
                        PhoneController.text.length != 0 &&
                        addressController.text.length != 0 &&
                        passController.text.length != 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginPage(
                                  mail: emailController.text.toString(),
                              pass:passController.text.toString()
                              )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Enter all fields"),
                      ));
                    }
                  },
                  child: const Text("Signup"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
