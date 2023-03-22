import 'package:fake_store/constants.dart';
import 'package:fake_store/responsive_layouts/mobile/Signup.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';
import 'package:fake_store/utils/authHelper.dart';
import 'package:fake_store/utils/sharedPrfs.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailContrller = TextEditingController();
  final TextEditingController _passContrller = TextEditingController();
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/fe/e5/ea/fee5eab30a698c169dc4fd5752359c2c.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h(100),
              TextFormField(
                controller: _emailContrller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              h(10),
              TextFormField(
                controller: _passContrller,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              h(30),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tap = true;
                      });
                      AuthenticationHelper()
                          .signIn(
                              email: _emailContrller.text,
                              password: _passContrller.text)
                          .then((result) {
                        if (result == null) {
                          setState(() {
                            setSharedPreference('LOGIN', "true");
                          });
                          setState(() {
                            tap = false;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobileScaffol()));
                        } else {
                          setState(() {
                            tap = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              result,
                              style: TextStyle(fontSize: 16),
                            ),
                          ));
                        }
                      });

                      // AuthServices.signinUser(
                      //     _emailContrller.text, _passContrller.text, context);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const LoginPage()),
                      // );
                    },
                    child: tap == true
                        ? SizedBox(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                            height: 20,
                            width: 20)
                        : Text("Login")),
              ),
              h(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: const Text(
                  "Don't have an account? SignUp",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
