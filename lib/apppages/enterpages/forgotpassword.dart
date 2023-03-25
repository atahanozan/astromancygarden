import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/enterpages/login_page.dart';
import 'package:fortunetell/core/backgroun_register_login.dart';
import 'package:fortunetell/core/frotedglass.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailcontroller = TextEditingController();

  Future resetPassword() async {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailcontroller.text.trim());
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LoginPageView()));
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const EnteringBackgroundPage(),
          FittedBox(
            fit: BoxFit.contain,
            child: FrostedGlassView(
              theheight: 650,
              thewidth: 350,
              thechild: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/signup.png"),
                    _textFormFiled(
                      customtype: TextInputType.emailAddress,
                      customicon: Icons.email_rounded,
                      customlabel: 'E-Mail',
                      customcontroller: _emailcontroller,
                      customobsicure: false,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.amber.shade300)),
                              onPressed: () {
                                resetPassword();
                              },
                              child: const Text("Şifre Gönder")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _textFormFiled extends StatelessWidget {
  const _textFormFiled({
    Key? key,
    required this.customlabel,
    required this.customicon,
    required this.customcontroller,
    required this.customobsicure,
    required this.customtype,
  }) : super(key: key);

  final String customlabel;
  final IconData customicon;
  final TextEditingController customcontroller;
  final bool customobsicure;
  final TextInputType customtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: customtype,
        obscureText: customobsicure,
        controller: customcontroller,
        decoration: InputDecoration(
          label: Text(customlabel),
          icon: Icon(
            customicon,
            color: Colors.amber,
          ),
        ));
  }
}
