import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/enterpages/login_page.dart';
import 'package:fortunetell/apppages/enterpages/register_page.dart';
import 'package:fortunetell/service/auth.dart';

class LogoutDeletSection extends StatefulWidget {
  const LogoutDeletSection({Key? key}) : super(key: key);

  @override
  State<LogoutDeletSection> createState() => _LogoutDeletSectionState();
}

class _LogoutDeletSectionState extends State<LogoutDeletSection> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text(
                              'Hesaptan çıkış yapmak istediğinize emin misiniz?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Hayır',
                                  style: TextStyle(color: Colors.purple),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                onPressed: () {
                                  _authService.signOut();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPageView()));
                                },
                                child: const Text('Evet'))
                          ],
                        ));
              },
              child: const Text(
                'Hesaptan Çıkış Yap',
                style: TextStyle(color: Colors.black54),
              )),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text(
                              'Hesabı kalıcı olarak silmek istediğinize emin misiniz?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Hayır',
                                  style: TextStyle(color: Colors.purple),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                onPressed: () {
                                  _authService.deleteUser();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPageView()));
                                },
                                child: const Text('Evet'))
                          ],
                        ));
              },
              child: Text('Hesabı Sil',
                  style: TextStyle(color: Colors.red.shade700))),
        ],
      ),
    );
  }
}
