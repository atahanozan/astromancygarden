import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortunetell/apppages/enterpages/forgotpassword.dart';
import 'package:fortunetell/apppages/enterpages/register_page.dart';
import 'package:fortunetell/core/backgroun_register_login.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/navbar.dart';
import 'package:fortunetell/service/auth.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  String customsubtitle =
      "Bu uygulama fisis tarafından üretilmiştir. Bütün hakları saklıdır.";

  String customwarning = "";

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final AuthService _authService = AuthService();

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
              theheight: 700,
              thewidth: 350,
              thechild: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/signup.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(customwarning),
                    ),
                    _textFormFiled(
                      customtype: TextInputType.emailAddress,
                      customicon: Icons.email_rounded,
                      customlabel: 'E-Mail',
                      customcontroller: _emailcontroller,
                      customobsicure: false,
                    ),
                    _textFormFiled(
                      customtype: TextInputType.text,
                      customicon: Icons.key_rounded,
                      customlabel: 'Şifre',
                      customcontroller: _passwordcontroller,
                      customobsicure: true,
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
                                if (_emailcontroller.text.isNotEmpty &&
                                    _passwordcontroller.text.isNotEmpty) {
                                  try {
                                    setState(() {
                                      _authService
                                          .signIn(_emailcontroller.text,
                                              _passwordcontroller.text)
                                          .then((
                                        value,
                                      ) async {
                                        if (!mounted) return;
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const NavBar()));
                                      });
                                    });
                                  } on FirebaseAuthException catch (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(error.toString())));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Lütfen eksik bilgileri doldurunuz.")));
                                }
                              },
                              child: const Text("Giriş Yap")),
                          TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPageView())),
                              child: const Text(
                                "Kayıt Ol",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          _authService.signInWithGoogle().then(
                                (value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavBar(),
                                  ),
                                ),
                              );
                        },
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: FaIcon(FontAwesomeIcons.google),
                            ),
                            Text('Google ile devam et'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const Text('Şifremi Unuttum'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        customsubtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    )
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
