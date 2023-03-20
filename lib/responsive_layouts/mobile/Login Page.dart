import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final mail;
  final pass;
  const LoginPage({Key? key, this.mail, this.pass}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.toString() == "abc@gmail.com" &&
                        passController.text.toString() == "123456") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileScaffol()));
                    } else if (emailController.text.toString() ==
                            "xyz@gmail.com" &&
                        passController.text.toString() == "123456") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileScaffol()));
                    } else if (emailController.text.toString() ==
                            widget.mail.toString() &&
                        passController.text.toString() ==
                            widget.pass.toString()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileScaffol()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Incorrect credentials."),
                      ));
                    }
                  },
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
