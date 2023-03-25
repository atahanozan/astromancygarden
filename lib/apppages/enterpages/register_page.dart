import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/enterpages/login_page.dart';
import 'package:fortunetell/core/backgroun_register_login.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/service/auth.dart';
import '../../core/frotedglass.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  String customsubtitle =
      "Bu uygulama fisis tarafından üretilmiştir. Bütün hakları saklıdır.";
  String warning = "";

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _passwordcontrollertwo = TextEditingController();

  final AuthService _authService = AuthService();

  String imagename = DateTime.now().toString();

  String customimageURL =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

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
              theheight: 750,
              thewidth: 350,
              thechild: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(warning),
                    ),
                    _textFormFiled(
                      customtype: TextInputType.name,
                      customlabel: 'Ad Soyad',
                      customicon: Icons.account_circle_rounded,
                      customcontroller: _namecontroller,
                      customobsicure: false,
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
                    _textFormFiled(
                      customtype: TextInputType.text,
                      customicon: Icons.key_rounded,
                      customlabel: 'Şifre Tekrar',
                      customcontroller: _passwordcontrollertwo,
                      customobsicure: true,
                    ),
                    Column(
                      children: [
                        Text(
                          "Uyglamaya kayıt olarak ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                            'KVKK Sözleşme Detayları'),
                                        content: SingleChildScrollView(
                                            child: Text(textUtilities.kvkk)),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Tamam'))
                                        ],
                                      ));
                            },
                            child: Text("KVKK sözleşmesini ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.blue))),
                        Text(
                          "kabul etmiş sayılmaktasınız.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                if (_namecontroller.text.isNotEmpty &&
                                    _emailcontroller.text.isNotEmpty &&
                                    _passwordcontroller.text.isNotEmpty) {
                                  if (_passwordcontroller.text ==
                                      _passwordcontrollertwo.text) {
                                    setState(() {
                                      _authService.createPerson(
                                          _namecontroller.text,
                                          _emailcontroller.text,
                                          _passwordcontroller.text,
                                          customimageURL);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              content: Text(
                                                "Kayıt işleminiz başarılı bir şekilde gerçekleşti. Giriş sayfasına yönlendiriliyorsunuz.",
                                                style: TextStyle(fontSize: 30),
                                              )));

                                      Timer(
                                          const Duration(seconds: 3),
                                          () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPageView(),
                                              )));

                                      warning = "";
                                    });
                                  } else {
                                    setState(() {
                                      warning =
                                          "Parola Bilgileri Eşleşmemektedir.";
                                    });
                                  }
                                } else {
                                  setState(() {
                                    warning =
                                        "Lütfen Eksik Bilgileri Doldurunuz.";
                                  });
                                }
                              },
                              child: const Text("Kaydol")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPageView()));
                              },
                              child: const Text(
                                "Giriş Yap",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
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
