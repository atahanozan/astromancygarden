import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/tarotcards.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarotFortuneWidget extends StatefulWidget {
  const TarotFortuneWidget({
    Key? key,
    required this.getfal,
  }) : super(key: key);

  final VoidCallback getfal;

  @override
  State<TarotFortuneWidget> createState() => _TarotFortuneWidgetState();
}

class _TarotFortuneWidgetState extends State<TarotFortuneWidget> {
  String data =
      "Dileğinize Tamamen Karar Verdikten Sonra Kartlardan Birini Seçin Ve Sürenin Dolmasını Bekleyin...";

  List<String> tarotfal = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
  ];
  int start = 2;
  late Timer timer;
  String lasimage = "assets/tarotarka.png";
  String newFal = "1";
  String newExplain = "";
  bool durum = false;
  int image = 0;

  setFal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('newFal', newFal);
    pref.setString('newExplain', newExplain);
  }

  @override
  void initState() {
    super.initState();
  }

  void loadingPage() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        setState(() {
          Navigator.of(context).pop();
          timer.cancel();
          finalFortune();
          start = 2;
          durum = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void finalFortune() {
    newFal = tarotfal[Random().nextInt(tarotfal.length)];
    newExplain = newFal == "1"
        ? tarotCardUtilities.cardExplain1
        : newFal == "2"
            ? tarotCardUtilities.cardExplain2
            : newFal == "3"
                ? tarotCardUtilities.cardExplain3
                : newFal == "4"
                    ? tarotCardUtilities.cardExplain4
                    : newFal == "5"
                        ? tarotCardUtilities.cardExplain5
                        : newFal == "6"
                            ? tarotCardUtilities.cardExplain6
                            : newFal == "7"
                                ? tarotCardUtilities.cardExplain7
                                : newFal == "8"
                                    ? tarotCardUtilities.cardExplain8
                                    : newFal == "9"
                                        ? tarotCardUtilities.cardExplain9
                                        : newFal == "10"
                                            ? tarotCardUtilities.cardExplain10
                                            : newFal == "11"
                                                ? tarotCardUtilities
                                                    .cardExplain11
                                                : newFal == "12"
                                                    ? tarotCardUtilities
                                                        .cardExplain12
                                                    : newFal == "13"
                                                        ? tarotCardUtilities
                                                            .cardExplain13
                                                        : newFal == "14"
                                                            ? tarotCardUtilities
                                                                .cardExplain14
                                                            : newFal == "15"
                                                                ? tarotCardUtilities
                                                                    .cardExplain15
                                                                : newFal == "16"
                                                                    ? tarotCardUtilities
                                                                        .cardExplain16
                                                                    : newFal ==
                                                                            "17"
                                                                        ? tarotCardUtilities
                                                                            .cardExplain17
                                                                        : newFal ==
                                                                                "18"
                                                                            ? tarotCardUtilities.cardExplain18
                                                                            : newFal == "19"
                                                                                ? tarotCardUtilities.cardExplain19
                                                                                : newFal == "20"
                                                                                    ? tarotCardUtilities.cardExplain20
                                                                                    : newFal == "21"
                                                                                        ? tarotCardUtilities.cardExplain21
                                                                                        : newFal == "22"
                                                                                            ? tarotCardUtilities.cardExplain22
                                                                                            : newFal == "23"
                                                                                                ? tarotCardUtilities.cardExplain23
                                                                                                : newFal == "24"
                                                                                                    ? tarotCardUtilities.cardExplain24
                                                                                                    : newFal == "25"
                                                                                                        ? tarotCardUtilities.cardExplain25
                                                                                                        : newFal == "26"
                                                                                                            ? tarotCardUtilities.cardExplain26
                                                                                                            : newFal == "27"
                                                                                                                ? tarotCardUtilities.cardExplain27
                                                                                                                : newFal == "28"
                                                                                                                    ? tarotCardUtilities.cardExplain28
                                                                                                                    : newFal == "29"
                                                                                                                        ? tarotCardUtilities.cardExplain29
                                                                                                                        : newFal == "30"
                                                                                                                            ? tarotCardUtilities.cardExplain30
                                                                                                                            : newFal == "31"
                                                                                                                                ? tarotCardUtilities.cardExplain31
                                                                                                                                : newFal == "32"
                                                                                                                                    ? tarotCardUtilities.cardExplain32
                                                                                                                                    : newFal == "33"
                                                                                                                                        ? tarotCardUtilities.cardExplain33
                                                                                                                                        : newFal == "34"
                                                                                                                                            ? tarotCardUtilities.cardExplain34
                                                                                                                                            : newFal == "35"
                                                                                                                                                ? tarotCardUtilities.cardExplain35
                                                                                                                                                : newFal == "36"
                                                                                                                                                    ? tarotCardUtilities.cardExplain36
                                                                                                                                                    : newFal == "37"
                                                                                                                                                        ? tarotCardUtilities.cardExplain37
                                                                                                                                                        : newFal == "38"
                                                                                                                                                            ? tarotCardUtilities.cardExplain38
                                                                                                                                                            : newFal == "39"
                                                                                                                                                                ? tarotCardUtilities.cardExplain39
                                                                                                                                                                : newFal == "40"
                                                                                                                                                                    ? tarotCardUtilities.cardExplain40
                                                                                                                                                                    : newFal == "41"
                                                                                                                                                                        ? tarotCardUtilities.cardExplain41
                                                                                                                                                                        : newFal == "42"
                                                                                                                                                                            ? tarotCardUtilities.cardExplain42
                                                                                                                                                                            : newFal == "43"
                                                                                                                                                                                ? tarotCardUtilities.cardExplain43
                                                                                                                                                                                : newFal == "44"
                                                                                                                                                                                    ? tarotCardUtilities.cardExplain44
                                                                                                                                                                                    : newFal == "45"
                                                                                                                                                                                        ? tarotCardUtilities.cardExplain45
                                                                                                                                                                                        : newFal == "46"
                                                                                                                                                                                            ? tarotCardUtilities.cardExplain46
                                                                                                                                                                                            : newFal == "47"
                                                                                                                                                                                                ? tarotCardUtilities.cardExplain47
                                                                                                                                                                                                : newFal == "48"
                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain48
                                                                                                                                                                                                    : newFal == "49"
                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain49
                                                                                                                                                                                                        : newFal == "50"
                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain50
                                                                                                                                                                                                            : newFal == "51"
                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain51
                                                                                                                                                                                                                : newFal == "52"
                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain52
                                                                                                                                                                                                                    : newFal == "53"
                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain53
                                                                                                                                                                                                                        : newFal == "54"
                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain54
                                                                                                                                                                                                                            : newFal == "55"
                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain55
                                                                                                                                                                                                                                : newFal == "56"
                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain56
                                                                                                                                                                                                                                    : newFal == "57"
                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain57
                                                                                                                                                                                                                                        : newFal == "58"
                                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain58
                                                                                                                                                                                                                                            : newFal == "59"
                                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain59
                                                                                                                                                                                                                                                : newFal == "60"
                                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain60
                                                                                                                                                                                                                                                    : newFal == "61"
                                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain61
                                                                                                                                                                                                                                                        : newFal == "62"
                                                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain62
                                                                                                                                                                                                                                                            : newFal == "63"
                                                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain63
                                                                                                                                                                                                                                                                : newFal == "64"
                                                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain64
                                                                                                                                                                                                                                                                    : newFal == "65"
                                                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain65
                                                                                                                                                                                                                                                                        : newFal == "66"
                                                                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain66
                                                                                                                                                                                                                                                                            : newFal == "67"
                                                                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain67
                                                                                                                                                                                                                                                                                : newFal == "68"
                                                                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain68
                                                                                                                                                                                                                                                                                    : newFal == "69"
                                                                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain69
                                                                                                                                                                                                                                                                                        : newFal == "70"
                                                                                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain70
                                                                                                                                                                                                                                                                                            : newFal == "71"
                                                                                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain71
                                                                                                                                                                                                                                                                                                : newFal == "72"
                                                                                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain72
                                                                                                                                                                                                                                                                                                    : newFal == "73"
                                                                                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain73
                                                                                                                                                                                                                                                                                                        : newFal == "74"
                                                                                                                                                                                                                                                                                                            ? tarotCardUtilities.cardExplain74
                                                                                                                                                                                                                                                                                                            : newFal == "75"
                                                                                                                                                                                                                                                                                                                ? tarotCardUtilities.cardExplain75
                                                                                                                                                                                                                                                                                                                : newFal == "76"
                                                                                                                                                                                                                                                                                                                    ? tarotCardUtilities.cardExplain76
                                                                                                                                                                                                                                                                                                                    : newFal == "77"
                                                                                                                                                                                                                                                                                                                        ? tarotCardUtilities.cardExplain77
                                                                                                                                                                                                                                                                                                                        : tarotCardUtilities.cardExplain78;
    showDialog(
        context: context,
        builder: (dialogcontext) => AlertDialog(
              title: const Text("Bir Bakalım..."),
              content: SizedBox(
                height: 350,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: Text("Seçtiğiniz Kart:"),
                    ),
                    SizedBox(
                      height: 250,
                      width: 130,
                      child: Image.asset("assets/tarotcards/$newFal.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        newExplain,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                )),
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Share.share(newExplain, subject: 'Tarot Falım');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.share),
                        ),
                        Text('Paylaş'),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(dialogcontext);
                      widget().getfal;
                    },
                    child: Text(
                      "Kapat",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.green.shade700),
                    ))
              ],
            ));

    setFal();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        data,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.green.shade700),
      ),
      content: SizedBox(
        height: 400,
        child: IgnorePointer(
          ignoring: durum,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 1;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 1 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 2;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 2 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 3;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 3 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 4;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 4 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 5;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 5 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 6;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 6 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 7;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 7 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 8;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 8 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 9;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 9 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 10;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 10 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 11;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 11 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 12;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 12 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 13;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 13 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 14;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 14 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 15;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 15 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 16;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 16 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 17;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 17 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 18;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 18 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 19;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 19 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 20;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 20 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 21;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 21 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 22;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 22 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 23;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 23 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 24;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 24 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 25;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 25 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 26;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 26 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 27;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 27 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 28;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 28 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 29;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 29 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 30;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 30 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 31;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 31 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 32;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 32 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 33;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 33 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 34;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 34 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 35;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 35 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 36;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 36 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 37;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 37 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 38;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 38 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 39;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 39 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 40;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 40 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 41;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 41 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 42;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 42 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 43;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 43 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 44;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 44 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 45;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 45 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 46;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 46 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 47;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 47 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 48;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 48 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 49;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 49 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 50;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 50 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 51;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 51 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 52;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 52 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 53;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 53 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 54;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 54 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 55;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 55 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 56;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 56 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 57;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 57 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 58;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 58 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 59;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 59 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 60;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 60 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 61;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 61 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 62;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 62 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 63;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 63 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 64;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 64 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 65;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 65 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 66;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 66 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 67;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 67 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 68;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 68 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 69;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 69 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 70;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 70 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 71;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 71 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 72;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 72 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 73;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 73 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 74;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 74 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 75;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 75 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 76;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 76 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 77;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 77 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          loadingPage();
                          setState(() {
                            image = 78;
                            durum = true;
                          });
                        },
                        child: Image.asset(
                            image == 78 ? 'assets/loading.gif' : lasimage),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Kapat",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.green.shade700),
            ))
      ],
    );
  }
}
