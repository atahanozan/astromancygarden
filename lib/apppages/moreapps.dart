import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/aboutus.dart';
import 'package:fortunetell/apppages/homepage.dart';
import 'package:fortunetell/apppages/signdetails.dart';
import 'package:fortunetell/apppages/tarotpage.dart';
import 'package:fortunetell/apppages/wishcards.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:fortunetell/service/auth.dart';

class MoreApps extends StatefulWidget {
  const MoreApps({Key? key}) : super(key: key);

  @override
  State<MoreApps> createState() => _MoreAppsState();
}

class _MoreAppsState extends State<MoreApps> {
  AuthService _authService = AuthService();
  String welcoming = 'Hoş Geldin';
  void navigatePage(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  String? uid, name;

  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final mailController = TextEditingController();
  final messageController = TextEditingController();

  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_5zt2qzt";
    const templateId = "template_prny5um";
    const userID = "nyA_vUhjJEV1bajRM";
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'origin': 'http://localhost'
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userID,
          "template_params": {
            "name": nameController.text,
            "subject": subjectController.text,
            "message": messageController.text,
            "user_email": mailController.text,
          }
        }));
    return response.statusCode;
  }

  @override
  void initState() {
    _authService.getCurrentUser().then((value) {
      setState(() {
        uid = value?.uid;
        name = value?.displayName;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var customname = name!.split(' ');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/gecesonbg.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 50,
            top: 70,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        ('$welcoming ${customname[0]}'),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.limelight(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const MenuButton(
                        name: 'Günlük Fal',
                        imgname: 'assets/bottomnavbaritems/clear.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WishCardsPageView()));
                      },
                      child: const MenuButton(
                        name: 'Dilek Kartı',
                        imgname: 'assets/bottomnavbaritems/lamba.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignDetailsPage(),
                          ),
                        );
                      },
                      child: const MenuButton(
                        name: 'Burçlar',
                        imgname: 'assets/bottomnavbaritems/cark.png',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TarotPage()));
                      },
                      child: const MenuButton(
                        name: 'Tarot Falı',
                        imgname: 'assets/bottomnavbaritems/cards.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: const Text(
                                      'Rüya tabirleri yakında sizlerle olacak. Güncellemeleri takip edin...'),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Tamam'))
                                  ],
                                ));
                      },
                      child: const MenuButton(
                        name: 'Rüya Tabirleri',
                        imgname: 'assets/bottomnavbaritems/zzz.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title:
                                      const Text("Falcı İle İletişime Geçin"),
                                  actions: [
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(
                                              textUtilities.mailsub,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: TextFormField(
                                              controller: nameController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                icon: Icon(Icons
                                                    .account_circle_rounded),
                                                label: Text("İsim"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              controller: mailController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                icon: Icon(Icons.email_rounded),
                                                label: Text("E-mail"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: TextFormField(
                                              controller: subjectController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                icon:
                                                    Icon(Icons.subject_rounded),
                                                label: Text("Konu"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: TextFormField(
                                              maxLines: 10,
                                              controller: messageController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                icon:
                                                    Icon(Icons.message_rounded),
                                                label: Text("Mesaj"),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text(
                                                    "Kapat",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.black),
                                                  onPressed: () {
                                                    sendEmail();
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    "Mesajınız Falcıya Gönderilmiştir.")));
                                                  },
                                                  child: const Text("Gönder")),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                      },
                      child: const MenuButton(
                        name: 'Mesaj',
                        imgname: 'assets/bottomnavbaritems/zarf.png',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()));
                      },
                      child: const MenuButton(
                        name: 'Hakkımızda',
                        imgname: 'assets/bottomnavbaritems/insanlar.png',
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: FrostedGlassView(
                          theheight: 110,
                          thewidth: 200,
                          thechild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  RotateAnimatedText(
                                    'TAROT FALI',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 30,
                                    ),
                                  ),
                                  RotateAnimatedText(
                                    'GÜNLÜK FAL',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 30,
                                    ),
                                  ),
                                  RotateAnimatedText(
                                    'BURÇ YORUMLARI',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                  RotateAnimatedText(
                                    'RÜYA TABİRLERİ',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                  RotateAnimatedText(
                                    'DİLEK KARTLARI',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                  RotateAnimatedText(
                                    'KAHVE FALI',
                                    textStyle: GoogleFonts.sigmarOne(
                                      color: Colors.black87,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({
    Key? key,
    required this.name,
    required this.imgname,
  }) : super(key: key);

  final String name;
  final String imgname;

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FrostedGlassView(
          thewidth: 110,
          theheight: 110,
          thechild: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(widget().imgname),
          ),
        ),
        Text(
          widget().name,
          style: GoogleFonts.comfortaa(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
