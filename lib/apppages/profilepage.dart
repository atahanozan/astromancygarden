import 'package:flutter/material.dart';
import 'package:fortunetell/core/profilepage/addstatusection.dart';
import 'package:fortunetell/core/profilepage/logout_deleteaccount.dart';
import 'package:fortunetell/core/profilepage/namesection.dart';
import 'package:fortunetell/core/profilepage/statussection.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ProfileNamePage(),
            ),
            Divider(),
            AddStatuSection(),
            StatusSectionPage(),
            Divider(),
            LogoutDeletSection(),
          ],
        ),
      ),
    );
  }
}
