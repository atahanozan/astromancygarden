import 'package:flutter/material.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/profilepage/addstatusection.dart';
import 'package:fortunetell/core/profilepage/logout_deleteaccount.dart';
import 'package:fortunetell/core/profilepage/namesection.dart';
import 'package:fortunetell/core/profilepage/statussection.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/infobutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Text(
          "PROFİL",
          style: GoogleFonts.benchNine(
            fontSize: 25,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          InfoButton(
            content: Text('deneme'),
            title: Text("Astromency Garden Discover Hakkında Bilgiler"),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/gecesonbg.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ProfileNamePage(),
              ),
              const Divider(),
              FrostedGlassView(
                  thewidth: 400,
                  theheight: 1200,
                  thechild: Column(
                    children: const [
                      AddStatuSection(),
                      StatusSectionPage(),
                    ],
                  )),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: LogoutDeletSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
