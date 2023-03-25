import 'package:flutter/material.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/core/tarotwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarotPage extends StatefulWidget {
  const TarotPage({Key? key}) : super(key: key);

  @override
  State<TarotPage> createState() => _TarotPageState();
}

class _TarotPageState extends State<TarotPage> {
  String customtime = DateTime.now().toString();

  String newFal = "1";
  String newExplain = "";
  // Fal açıldığında 2 saatlik süreinin hafızada kalması için kullanılan fonksiyon
  Future<void> setTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('customtime', customtime);
    });
  }

  //sürenin hafızadan çekilmesi için kullanılan fonksiyon
  Future<void> getTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      customtime = prefs.getString('customtime') ?? DateTime.now().toString();
    });
  }

  //tarot kart anlamlarının hafızadan çekilmesi için kullanılan fonksiyon
  Future<void> getFal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      newFal = pref.getString('newFal') ?? "1";
      newExplain = pref.getString('newExplain') ?? "";
    });
  }

  double customheight = 350;
  double customheightlast = 0;
  double customheighttree = 0;
  double heighttarot = 0;

  @override
  void initState() {
    super.initState();
    getFal();
    getTime().then((value) {
      setState(() {
        DateTime zaman = DateTime.parse(customtime);
        if (zaman.isBefore(DateTime.now())) {
          setState(() {
            customheight = 350;
            customheightlast = 0;
            heighttarot = 0;
          });
        } else {
          setState(() {
            customheight = 0;
            customheightlast = 400;
            heighttarot = 250;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 15,
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Image.asset("assets/skygreen.png"),
              Row(
                children: [
                  Text(
                    "Tarot Kartları",
                    style: GoogleFonts.kaushanScript(fontSize: 50),
                  ),
                  InfoButton(
                      content: Text(textUtilities.klavuztarot),
                      title: const Text("Tarot Fal Klavuzu"))
                ],
              )
            ]),
          ),
          SizedBox(
            height: customheight,
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Tarot Falına Başlamak İçin \nUygulamanın Kalbine \nDokunun",
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: FloatingActionButton.large(
                              heroTag: "btn3",
                              backgroundColor: const Color(0xFFC8E6C9),
                              foregroundColor: Colors.red.shade900,
                              onPressed: () {
                                setState(() {
                                  customtime = DateTime.now()
                                      .add(const Duration(hours: 2))
                                      .toString();
                                  setTime();
                                  customheight = 0;
                                  customheightlast = 400;
                                  heighttarot = 250;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) => TarotFortuneWidget(
                                          getfal: () {
                                            getFal();
                                          },
                                        ));
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
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: customheightlast,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade100,
                            foregroundColor: Colors.greenAccent.shade700),
                        child: Text(
                            heighttarot == 250 ? 'Önceki Fal' : 'Falı Kapat'),
                        onPressed: () {
                          getFal();

                          if (heighttarot == 250) {
                            setState(() {
                              customheighttree = 1200;
                              heighttarot = 0;
                              customheightlast = 150;
                            });
                          } else {
                            setState(() {
                              customheighttree = 0;
                              heighttarot = 250;
                              customheightlast = 400;
                            });
                          }
                        },
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  "Yeni Tarot falı için sürenin dolmasını bekleyiniz."),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                height: heighttarot,
                                width: 130,
                                child: Image.asset("assets/tarotarka.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: customheighttree,
                    child: Column(
                      children: [
                        Text(
                          "Bir önceki Tarot Falınız",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: 250,
                            width: 130,
                            child: Image.asset("assets/tarotcards/$newFal.png"),
                          ),
                        ),
                        Text(
                          newExplain,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}