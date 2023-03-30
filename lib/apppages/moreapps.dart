import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/aboutus.dart';
import 'package:fortunetell/apppages/homepage.dart';
import 'package:fortunetell/apppages/tarotpage.dart';
import 'package:fortunetell/apppages/wishcards.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MoreApps extends StatefulWidget {
  const MoreApps({Key? key}) : super(key: key);

  @override
  State<MoreApps> createState() => _MoreAppsState();
}

class _MoreAppsState extends State<MoreApps> {
  final String pageComment =
      'Falcı ile iltişim, Rüya tabirleri ve çok daha fazlasına bu sayfadan ulaşabilirsiniz.';
  final String imgDream =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Fdream.png?alt=media&token=fe1fc093-f5ea-456b-a497-70eff93deb5f';
  final String imgMessage =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Fmessage.png?alt=media&token=1fb0b1e5-5f59-42a1-a309-c117381cb8b8';
  final String imgAboutus =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Faboutus.png?alt=media&token=d7c4c0e5-59e6-466f-b0a6-f4265788332e';

  void navigatePage(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'ASTROMANCY GARDEN',
          style: GoogleFonts.benchNine(
            fontSize: 25,
          ),
        ),
        actions: const [
          InfoButton(
            content: Text('dememe'),
            title: Text('deneme'),
          ),
        ],
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
            top: 100,
          ),
          child: Column(
            children: [
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
                                builder: (context) =>
                                    const WishCardsPageView()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
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
                                                  child: const Text("Kapat")),
                                              ElevatedButton(
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
