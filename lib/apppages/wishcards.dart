import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class WishCardsPageView extends StatefulWidget {
  const WishCardsPageView({Key? key}) : super(key: key);

  @override
  State<WishCardsPageView> createState() => _WishCardsPageViewState();
}

class _WishCardsPageViewState extends State<WishCardsPageView> {
  double _height = 350;
  double _height2 = 0;

  String? name, command, image;

  int randomnum = 1;
  int customnum = 1;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('WishCards')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        randomnum = querySnapshot.docs.length;
      });
    });

    super.initState();
  }

  //name, command ve image değişkenlerine random değer atanması için Firebase bağlantılı fonksiyon
  void heartFun() {
    setState(() {
      _height = 0;
      _height2 = 350;
      setState(() {
        customnum = Random().nextInt(randomnum - 1) + 1;
      });
      FirebaseFirestore.instance
          .collection('WishCards')
          .where('line', isEqualTo: customnum.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var element in querySnapshot.docs) {
          setState(() {
            name = element['article'].toString();
            command = element['command'].toString();
            image = element['image'].toString();
          });
        }
      });
    });
  }

  //Kartlara dokunulduğunda uzun basılması gerektiğini aktaran snackbar fonksiyoun
  void onTapFun() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.orange,
      content: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Dilek kartına uzun basınız.'),
      ),
    ));
  }

  // kartlara uzun basıldığında çıkan sonuçları aktaran alertdialog fonksiyonu
  void onLongPressFun() {
    setState(() {
      _height = 350;
      _height2 = 0;
    });
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('Dilek Kartından $name Çıktı'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(image.toString())),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(command.toString()),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tamam'))
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          title: Text(
            'DİLEK KARTLARI',
            style: GoogleFonts.benchNine(
              fontSize: 25,
            ),
          ),
          actions: [
            InfoButton(
              content: Text(textUtilities.klavuzchance),
              title: const Text('Dilek Kartları Kullanım Kılavuzu'),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: _height2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Dileğini tut ve sana en sıcak gelen kartı seç ve basılı tut\nKart sana söylenecekleri söylesin.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(),
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.green,
                            onTap: () {
                              onTapFun();
                            },
                            onLongPress: () {
                              onLongPressFun();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height: 200,
                                child: Image.asset('assets/wishcard.png'),
                              ),
                            ),
                          ),
                          InkWell(
                            highlightColor: Colors.green,
                            onTap: () {
                              onTapFun();
                            },
                            onLongPress: () {
                              onLongPressFun();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height: 200,
                                child: Image.asset('assets/wishcard.png'),
                              ),
                            ),
                          ),
                          InkWell(
                            highlightColor: Colors.green,
                            onTap: () {
                              onTapFun();
                            },
                            onLongPress: () {
                              onLongPressFun();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height: 200,
                                child: Image.asset('assets/wishcard.png'),
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
            SizedBox(
              height: _height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Dilek Kartlarını Açmak İçin \nUygulamanın Kalbine \nDokunun",
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: LikeButton(
                        size: 100,
                        onTap: (isLiked) async {
                          Timer(const Duration(milliseconds: 400),
                              () => heartFun());
                          return !isLiked;
                        },
                      ),
                    ),
                  ]),
            ),
          ]),
        )));
  }
}
