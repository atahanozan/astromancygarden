import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/navbar.dart';
import 'package:fortunetell/service/auth.dart';
import 'enterpages/login_page.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => _authService.getCurrentUser().then((user) {
              if (user == null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageView()));
              } else {
                _authService.getCurrentUser().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar())));
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: FittedBox(
            fit: BoxFit.contain, child: Image.asset("assets/splash2.png")),
      ),
    );
  }
}
