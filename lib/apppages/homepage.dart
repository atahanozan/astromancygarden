import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  TextEditingController explaincontroller = TextEditingController();

  late Timer _othertimer;
  late String start;
  int _startlast = 3;
  String? firecolor;
  String? fireanimal;
  String? fireplant;
  String? firerock;
  String newColor = "";
  String newAnimal = "";
  String newPlant = "";

  String newRock = "";
  String falColor = "";
  String falAnimal = "";
  String imageAnimal =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
  String falPlant = "";
  String imagePlant =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
  String falRock = "";
  String imageRock =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
  String imageColor =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
  double ask = 0;
  double para = 0;
  double sans = 0;
  Color iconcolor = Colors.white;
  String? uid, name, email, nametwo, image;
  double _height = 350;
  double _height2 = 0;
  int? firecount;

  Future<void> setItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('start', start);
    pref.setString('newColor', newColor);
    pref.setString('newAnimal', newAnimal);
    pref.setString('newPlant', newPlant);
    pref.setString('newRock', newRock);
    pref.setString('falColor', falColor);
    pref.setString('imageColor', imageColor);
    pref.setString('imageAnimal', imageAnimal);
    pref.setString('falAnimal', falAnimal);
    pref.setString('imagePlant', imagePlant);
    pref.setString('falPlant', falPlant);
    pref.setString('imageRock', imageRock);
    pref.setString('falRock', falRock);
    pref.setString('firecolor', firecolor.toString());
    pref.setString('fireanimal', fireanimal.toString());
    pref.setString('fireplant', fireplant.toString());
    pref.setString('firerock', firerock.toString());
    pref.setDouble('ask', ask);
    pref.setDouble('para', para);
    pref.setDouble('sans', sans);
  }

  Future<void> getItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      start = pref.getString('start') ?? DateTime.now().toString();
      newColor = pref.getString('newColor') ?? "";
      newAnimal = pref.getString('newAnimal') ?? "";
      newPlant = pref.getString('newPlant') ?? "";
      newRock = pref.getString('newRock') ?? "";
      falColor = pref.getString('falColor') ?? "";
      imageColor = pref.getString('imageColor') ??
          "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
      imageAnimal = pref.getString('imageAnimal') ??
          "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
      falAnimal = pref.getString('falAnimal') ?? "";
      imagePlant = pref.getString('imagePlant') ??
          "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
      falPlant = pref.getString('falPlant') ?? "";
      imageRock = pref.getString('imageRock') ??
          "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
      falRock = pref.getString('falRock') ?? "";
      firecolor = pref.getString('firecolor') ?? "";
      fireanimal = pref.getString('fireanimal') ?? "";
      fireplant = pref.getString('fireplant') ?? "";
      firerock = pref.getString('firerock') ?? "";
      ask = pref.getDouble('ask') ?? 0;
      para = pref.getDouble('para') ?? 0;
      sans = pref.getDouble('sans') ?? 0;
    });
  }

  void startLoadingTimer() {
    const otherOneSec = Duration(seconds: 1);
    _othertimer = Timer.periodic(otherOneSec, (timer) {
      if (_startlast == 0) {
        setState(() {
          Navigator.pop(context);
          timer.cancel();
          _startlast = 3;
          _height = 0;
          _height2 = 800;
          _randomColor();
        });
      } else {
        setState(() {
          _startlast--;
        });
      }
    });
  }

  @override
  void initState() {
    getItems().then((value) {
      setState(() {
        Duration fark = DateTime.parse(start).difference(
          DateTime.now(),
        );
        FirebaseFirestore.instance
            .collection('daily')
            .where('item', isEqualTo: 'color')
            .where('num', isEqualTo: firecolor)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var color in querySnapshot.docs) {
            setState(() {
              newColor = color['name'];
              falColor = color['fal'];
              imageColor = color['pic'];
            });
          }
        });
        FirebaseFirestore.instance
            .collection('daily')
            .where('item', isEqualTo: 'animal')
            .where('num', isEqualTo: fireanimal)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var animal in querySnapshot.docs) {
            setState(() {
              newAnimal = animal['name'];
              falAnimal = animal['fal'];
              imageAnimal = animal['pic'];
            });
          }
        });
        FirebaseFirestore.instance
            .collection('daily')
            .where('item', isEqualTo: 'plant')
            .where('num', isEqualTo: fireplant)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var plant in querySnapshot.docs) {
            setState(() {
              newPlant = plant['name'];
              falPlant = plant['fal'];
              imagePlant = plant['pic'];
            });
          }
        });
        FirebaseFirestore.instance
            .collection('daily')
            .where('item', isEqualTo: 'rock')
            .where('num', isEqualTo: firerock)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var rock in querySnapshot.docs) {
            setState(() {
              newRock = rock['name'];
              falRock = rock['fal'];
              imageRock = rock['pic'];
            });
          }
        });

        Duration son = const Duration(
          hours: 0,
          minutes: 0,
          seconds: 0,
          milliseconds: 0,
          microseconds: 0,
        );

        if (fark <= son) {
          setState(() {
            _height = 350;
            _height2 = 0;
          });
        } else {
          setState(() {
            _height = 0;
            _height2 = 800;
          });
        }
      });
    });

    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
        email = user?.email;
      });
      FirebaseFirestore.instance
          .collection('Person')
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var element in querySnapshot.docs) {
          setState(() {
            nametwo = element['userName'];
          });
        }
      });
    });
    super.initState();
  }

  void _randomColor() {
    setState(() {
      firecolor = (Random().nextInt(6) + 1).toString();
      fireanimal = (Random().nextInt(6) + 1).toString();
      fireplant = (Random().nextInt(6) + 1).toString();
      firerock = (Random().nextInt(6) + 1).toString();
      FirebaseFirestore.instance
          .collection('daily')
          .where('item', isEqualTo: 'color')
          .where('num', isEqualTo: firecolor)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var color in querySnapshot.docs) {
          setState(() {
            newColor = color['name'];
            falColor = color['fal'];
            imageColor = color['pic'];
          });
        }
      });
      FirebaseFirestore.instance
          .collection('daily')
          .where('item', isEqualTo: 'animal')
          .where('num', isEqualTo: fireanimal)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var animal in querySnapshot.docs) {
          setState(() {
            newAnimal = animal['name'];
            falAnimal = animal['fal'];
            imageAnimal = animal['pic'];
          });
        }
      });
      FirebaseFirestore.instance
          .collection('daily')
          .where('item', isEqualTo: 'plant')
          .where('num', isEqualTo: fireplant)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var plant in querySnapshot.docs) {
          setState(() {
            newPlant = plant['name'];
            falPlant = plant['fal'];
            imagePlant = plant['pic'];
          });
        }
      });
      FirebaseFirestore.instance
          .collection('daily')
          .where('item', isEqualTo: 'rock')
          .where('num', isEqualTo: firerock)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var rock in querySnapshot.docs) {
          setState(() {
            newRock = rock['name'];
            falRock = rock['fal'];
            imageRock = rock['pic'];
          });
        }
      });
      ask = Random().nextDouble();
      para = Random().nextDouble();
      sans = Random().nextDouble();
      start = DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        (DateTime.now().add(const Duration(days: 1)).day),
        6,
        0,
      ).toString();
      setItems();
    });
  }

  void likeButtonFun() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Image.asset("assets/loading.gif"),
            ));
    startLoadingTimer();
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
          'GÜNLÜK FAL',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: _height,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Günlük Falınızı Görmek İçin \nUygulamanın Kalbine \nDokunun",
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: LikeButton(
                              size: 100,
                              onTap: (isLiked) async {
                                Timer(const Duration(seconds: 1),
                                    () => likeButtonFun());
                                return !isLiked;
                              },
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                              height: _height2,
                              child: Column(children: [
                                const Text(
                                  "Günlük falınıza yarın yeniden bakabilirsiniz.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                Card(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          "Aşk, Para ve Sağlıkta Bugün",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 40,
                                            right: 40),
                                        child: CircularProgress(
                                            ask: ask, para: para, saglik: sans),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Bugünün Falı",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                FalAciklamasi(
                                  fal: 'Uğurlu Renk: $newColor',
                                  image: imageColor,
                                  explain: falColor,
                                ),
                                const Divider(),
                                FalAciklamasi(
                                  fal: 'Uğurlu Hayvan: $newAnimal',
                                  image: imageAnimal,
                                  explain: falAnimal,
                                ),
                                const Divider(),
                                FalAciklamasi(
                                  fal: 'Uğurlu Bitki: $newPlant',
                                  image: imagePlant,
                                  explain: falPlant,
                                ),
                                const Divider(),
                                FalAciklamasi(
                                  fal: 'Uğurlu Taş: $newRock',
                                  image: imageRock,
                                  explain: falRock,
                                ),
                              ])))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FalAciklamasi extends StatelessWidget {
  const FalAciklamasi({
    Key? key,
    required this.fal,
    required this.image,
    required this.explain,
  }) : super(key: key);

  final String fal;
  final String image;
  final String explain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                fal,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.network(image),
              ),
            ),
          ],
        ),
        Text(
          explain,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    Key? key,
    required this.ask,
    required this.para,
    required this.saglik,
  }) : super(key: key);

  final double ask;
  final double para;
  final double saglik;

  @override
  Widget build(BuildContext context) {
    final int percentask = (ask * 100).round();
    final int percentpara = (para * 100).round();
    final int percentsaglik = (saglik * 100).round();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      color: Colors.pink,
                      value: ask,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Text("%$percentask"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Aşk'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      color: Colors.green,
                      value: para,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Text("%$percentpara"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Para'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      color: Colors.purple,
                      value: saglik,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Text("%$percentsaglik"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Şans'),
            ),
          ],
        ),
      ],
    );
  }
}
