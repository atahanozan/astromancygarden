import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:fortunetell/service/sharestatus_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ShareStatusService _shareStatusService = ShareStatusService();
  final AuthService _authService = AuthService();
  TextEditingController explaincontroller = TextEditingController();

  List<String> renk = [
    "Kırmızı",
    "Turuncu",
    "Sarı",
    "Yeşil",
    "Mavi",
    "Lacivert",
    "Mor",
  ];

  List<String> hayvan = [
    "Kedi",
    "Baykuş",
    "Karınca",
    "Balık",
    "Kaplumbağa",
    "Fil",
    "Aslan",
  ];

  List<String> bitki = [
    "Yonca",
    "Papatya",
    "Karahindiba",
    "Sarmaşık",
    "Leylak",
    "Karanfil",
    "Lavanta",
  ];

  List<String> rock = [
    "Ametist",
    "Kaplan Gözü",
    "Akik",
    "Kuvars",
    "Selenit",
    "Güneş",
    "Ay",
  ];

  late Timer _othertimer;
  late String start;
  int _startlast = 3;
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
  double ask = 0;
  double para = 0;
  double sans = 0;
  Color iconcolor = Colors.white;
  String? uid, name, email, nametwo, image;
  double _height = 350;
  double _height2 = 0;

  String akik =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/akik.png?alt=media&token=b5ee4eb6-fff6-4dbc-88e9-868cd19ff442";
  String ametis =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/ametist.png?alt=media&token=3ea90956-630e-465e-b818-6bc2401e51d6";
  String ant =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/ant.png?alt=media&token=89c8cfbd-92c6-446b-93d7-0643813669af";
  String cat =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/cat.png?alt=media&token=77653ed7-43c9-4343-914d-b3ae81266c30";
  String clove =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/clove.png?alt=media&token=2fe88743-e4e2-4531-af15-95ed05aa129e";
  String clover =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/clover.png?alt=media&token=4410f9ef-5876-4085-ab4a-015cd891261c";
  String daisy =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/daisy.png?alt=media&token=797fe47c-8211-4722-9d57-5ad67a5b256c";
  String dandelion =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/dandelion.png?alt=media&token=a1f2648f-d6c4-4738-ba61-775f7b18d2d6";
  String elephant =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/elephant.png?alt=media&token=b7048b60-c18d-4d68-80ff-df3aa02ab0f1";
  String fish =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/fish.png?alt=media&token=43cdc008-b17c-45ef-aa7a-0119bcd8943b";
  String ivy =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/ivy.png?alt=media&token=09d87265-aa2d-488d-990d-8a08ad46d417";
  String kuvars =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/kuvars.png?alt=media&token=bb1389ec-bc9d-483f-8b8f-06d17aa16ecd";
  String lavender =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/lavender.png?alt=media&token=f2f2ddbd-3226-45e5-8569-add26fdfbb95";
  String leon =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/leon.png?alt=media&token=8e4d39ee-fb39-4b50-82ca-e509249f17b2";
  String lilac =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/lilac.png?alt=media&token=1833d3f9-0a0b-4b1a-869f-aeefa8316f82";
  String moon =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moon.png?alt=media&token=6865ab98-4539-4ea1-ac07-6455fb1f6f58";
  String owl =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/owl.png?alt=media&token=c3dab749-e69f-466a-b62a-d8bf79ede286";
  String selenyt =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/selenyt.png?alt=media&token=ab616f02-b7f5-4d19-be56-a452361d03dd";
  String sun =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/sun.png?alt=media&token=77c502bb-0db5-4ddd-811e-6cc8561cd0b6";
  String turtle =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/turtle.png?alt=media&token=5676fba3-8a0f-4d4c-946b-d6cc44fd8f41";
  String tygereye =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/tygereye.png?alt=media&token=37a6db47-5261-473d-af80-036e8787773f";

  Future<void> setItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('start', start);
    pref.setString('newColor', newColor);
    pref.setString('newAnimal', newAnimal);
    pref.setString('newPlant', newPlant);
    pref.setString('newRock', newRock);
    pref.setString('falColor', falColor);
    pref.setString('imageAnimal', imageAnimal);
    pref.setString('falAnimal', falAnimal);
    pref.setString('imagePlant', imagePlant);
    pref.setString('falPlant', falPlant);
    pref.setString('imageRock', imageRock);
    pref.setString('falRock', falRock);
    pref.setDouble('ask', ask);
    pref.setDouble('para', para);
    pref.setDouble('saglik', sans);
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
      imageAnimal = pref.getString('imageAnimal') ?? "";
      falAnimal = pref.getString('falAnimal') ?? "";
      imagePlant = pref.getString('imagePlant') ?? "";
      falPlant = pref.getString('falPlant') ?? "";
      imageRock = pref.getString('imageRock') ?? "";
      falRock = pref.getString('falRock') ?? "";
      ask = pref.getDouble('ask') ?? 0;
      para = pref.getDouble('para') ?? 0;
      sans = pref.getDouble('sans') ?? 0;
    });
  }

  void startTimer() {
    setState(() {
      FirebaseFirestore.instance
          .collection('Person')
          .where('email', isEqualTo: email.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var element in querySnapshot.docs) {
          setState(() {
            image = element['image'];
          });
        }
      });
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
        Duration son = const Duration(
          days: 0,
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
      newColor = renk[Random().nextInt(renk.length)];
      newAnimal = hayvan[Random().nextInt(hayvan.length)];
      newPlant = bitki[Random().nextInt(bitki.length)];
      newRock = rock[Random().nextInt(rock.length)];
      ask = Random().nextDouble();
      para = Random().nextDouble();
      sans = Random().nextDouble();
      if (newColor == "Sarı") {
        setState(() {
          iconcolor = Colors.yellow;
          falColor = textUtilities.yellow;
        });
      } else if (newColor == "Kırmızı") {
        setState(() {
          iconcolor = Colors.red;
          falColor = textUtilities.red;
        });
      } else if (newColor == "Yeşil") {
        setState(() {
          iconcolor = Colors.green;
          falColor = textUtilities.green;
        });
      } else if (newColor == "Mavi") {
        setState(() {
          iconcolor = Colors.blue;
          falColor = textUtilities.blue;
        });
      } else if (newColor == "Turuncu") {
        setState(() {
          iconcolor = Colors.orange;
          falColor = textUtilities.orange;
        });
      } else if (newColor == "Lacivert") {
        setState(() {
          iconcolor = Colors.indigo.shade900;
          falColor = textUtilities.darkblue;
        });
      } else {
        setState(() {
          iconcolor = Colors.purple;
          falColor = textUtilities.purple;
        });
      }

      falAnimal = newAnimal == "Kedi"
          ? textUtilities.cat
          : newAnimal == "Baykuş"
              ? textUtilities.owl
              : newAnimal == "Karınca"
                  ? textUtilities.ant
                  : newAnimal == "Balık"
                      ? textUtilities.fish
                      : newAnimal == "Kaplumbağa"
                          ? textUtilities.turtle
                          : newAnimal == "Fil"
                              ? textUtilities.elephant
                              : textUtilities.leon;
      imageAnimal = newAnimal == "Kedi"
          ? cat
          : newAnimal == "Baykuş"
              ? owl
              : newAnimal == "Karınca"
                  ? ant
                  : newAnimal == "Balık"
                      ? fish
                      : newAnimal == "Kaplumbağa"
                          ? turtle
                          : newAnimal == "Fil"
                              ? elephant
                              : leon;
      falPlant = newPlant == "Yonca"
          ? textUtilities.clover
          : newPlant == "Papatya"
              ? textUtilities.daisy
              : newPlant == "Karahindiba"
                  ? textUtilities.dandelion
                  : newPlant == "Sarmaşık"
                      ? textUtilities.ivy
                      : newPlant == "Leylak"
                          ? textUtilities.lilac
                          : newPlant == "Karanfil"
                              ? textUtilities.clove
                              : textUtilities.lavender;
      imagePlant = newPlant == "Yonca"
          ? clover
          : newPlant == "Papatya"
              ? daisy
              : newPlant == "Karahindiba"
                  ? dandelion
                  : newPlant == "Sarmaşık"
                      ? ivy
                      : newPlant == "Leylak"
                          ? lilac
                          : newPlant == "Karanfil"
                              ? clove
                              : lavender;
      falRock = newRock == "Ametist"
          ? textUtilities.ametist
          : newRock == "Kaplan Gözü"
              ? textUtilities.tygereye
              : newRock == "Akik"
                  ? textUtilities.akik
                  : newRock == "Kuvars"
                      ? textUtilities.kuvars
                      : newRock == "Selenit"
                          ? textUtilities.selenyt
                          : newRock == "Güneş"
                              ? textUtilities.sun
                              : textUtilities.moon;
      imageRock = newRock == "Ametist"
          ? ametis
          : newRock == "Kaplan Gözü"
              ? tygereye
              : newRock == "Akik"
                  ? akik
                  : newRock == "Kuvars"
                      ? kuvars
                      : newRock == "Selenit"
                          ? selenyt
                          : newRock == "Güneş"
                              ? sun
                              : moon;
      start = DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        (DateTime.now().add(const Duration(days: 1)).day),
        6,
        0,
      ).toString();
      setItems();
      showDialog(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: const Text("Günlük Falınız"),
                content: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Aşk, Para ve Sağlıkta Bugün",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 10),
                                child: CircularProgress(
                                    ask: ask, para: para, saglik: sans),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Uğurlu Renk: $newColor",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.circle_rounded,
                              size: 40,
                              color: iconcolor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        falColor,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Uğurlu Hayvan: $newAnimal",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(imageAnimal),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        falAnimal,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Uğurlu Bitki: $newPlant",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(imagePlant),
                            ),
                          )
                        ],
                      ),
                      Text(
                        falPlant,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Şanslı Taş: $newRock",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(imageRock),
                            ),
                          )
                        ],
                      ),
                      Text(
                        falRock,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text(
                                          "Lütfen paylaşımınızla ilgili bir kaç şey yazın..."),
                                      content: TextField(
                                        controller: explaincontroller,
                                        maxLength: 80,
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blue.shade800,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  _shareStatusService.addStatus(
                                                    newColor,
                                                    newAnimal,
                                                    newPlant,
                                                    newRock,
                                                    imageAnimal,
                                                    imagePlant,
                                                    imageRock,
                                                    DateTime.now().toString(),
                                                    explaincontroller.text,
                                                    uid.toString(),
                                                    nametwo.toString(),
                                                    image.toString(),
                                                    email.toString(),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: const Text(
                                                        "Paylaşım Yapıldı"),
                                                    backgroundColor:
                                                        Colors.green.shade900,
                                                    duration: const Duration(
                                                        milliseconds: 450),
                                                  ));
                                                },
                                                child: const Text("Paylaş")),
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Kapat")),
                                          ],
                                        ),
                                      ],
                                    ));
                          },
                          child: const Text("Paylaş")),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Kapat")),
                    ],
                  ),
                ],
              ),
            );
          });
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 15,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset("assets/skyblue.png"),
                  Row(
                    children: [
                      Text(
                        "Günlük Fal",
                        style: GoogleFonts.kaushanScript(fontSize: 50),
                      ),
                      InfoButton(
                        content: Text(textUtilities.klavuzdaily),
                        title: const Text("Günlük Fal Klavuzu"),
                      )
                    ],
                  )
                ],
              ),
            ),
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
                          child: FloatingActionButton.large(
                              heroTag: "btn1",
                              backgroundColor: Colors.blue.shade100,
                              foregroundColor: Colors.red.shade900,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content:
                                              Image.asset("assets/loading.gif"),
                                        ));
                                startLoadingTimer();
                              },
                              child: const Icon(
                                Icons.favorite_rounded,
                                size: 50,
                              )),
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
                              Text(
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
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Uğurlu Renk: $newColor",
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Icon(
                                      Icons.circle_rounded,
                                      size: 40,
                                      color: iconcolor,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                falColor,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Uğurlu Hayvan: $newAnimal",
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(imageAnimal),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                falAnimal,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Uğurlu Bitki: $newPlant",
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(imagePlant),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                falPlant,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Şanslı Taş: $newRock",
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(imageRock),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                falRock,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade800,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text(
                                                  "Lütfen paylaşımınızla ilgili bir kaç şey yazın..."),
                                              content: TextField(
                                                controller: explaincontroller,
                                                maxLength: 80,
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.blue
                                                                  .shade800,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          _shareStatusService
                                                              .addStatus(
                                                            newColor,
                                                            newAnimal,
                                                            newPlant,
                                                            newRock,
                                                            imageAnimal,
                                                            imagePlant,
                                                            imageRock,
                                                            DateTime.now()
                                                                .toString(),
                                                            explaincontroller
                                                                .text,
                                                            uid.toString(),
                                                            nametwo.toString(),
                                                            image.toString(),
                                                            email.toString(),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: const Text(
                                                                "Paylaşım Yapıldı"),
                                                            backgroundColor:
                                                                Colors.green
                                                                    .shade900,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        450),
                                                          ));
                                                        },
                                                        child: const Text(
                                                            "Paylaş")),
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            "Kapat")),
                                                  ],
                                                ),
                                              ],
                                            ));
                                  },
                                  child: const Text("Paylaş"))
                            ])))),
              ],
            ),
          ],
        ),
      ),
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
