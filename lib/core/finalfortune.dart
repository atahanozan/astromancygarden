import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortunetell/core/tarotcards.dart';

class FinalFortunePage extends StatefulWidget {
  const FinalFortunePage({Key? key}) : super(key: key);

  @override
  State<FinalFortunePage> createState() => _FinalFortunePageState();
}

class _FinalFortunePageState extends State<FinalFortunePage> {
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
  String newFal = "1";
  String newExplain = "";

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
    SizedBox(
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
              "Bu kart: \n$newExplain",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
