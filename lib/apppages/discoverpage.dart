import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:fortunetell/service/favorites_service.dart';
import 'package:fortunetell/service/sharestatus_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverViewPage extends StatefulWidget {
  const DiscoverViewPage({Key? key}) : super(key: key);

  @override
  State<DiscoverViewPage> createState() => _DiscoverViewPageState();
}

class _DiscoverViewPageState extends State<DiscoverViewPage> {
  final ShareStatusService _shareStatusService = ShareStatusService();
  final AuthService _authService = AuthService();
  final FavoriteSharesService _favoriteSharesService = FavoriteSharesService();

  String? uid, name, networkemail;
  int pagecount = 0;

  String imageURL =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

  Color customColor = Colors.white;

  void chanceColor() {
    setState(() {
      customColor = Colors.amber;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      pagecount++;
    });

    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
      });
    });
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  String networkImage =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Astromancy Garden",
          style: GoogleFonts.amaticSc(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade800,
        actions: [
          InfoButton(
            content: Text(textUtilities.klavuzdiscover),
            title: const Text("Astromency Garden Discover Hakkında Bilgiler"),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: StreamBuilder(
          stream: _shareStatusService.getStatus(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    addAutomaticKeepAlives: false,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snapshot.data!.docs[index];

                      DateTime datetime = DateTime.parse(mypost['datetime']);
                      String datetimeyear = datetime.year.toString();
                      String datetimemonth = datetime.month < 10
                          ? "0${datetime.month}"
                          : datetime.month.toString();
                      String datetimeday = datetime.day < 10
                          ? "0${datetime.day}"
                          : datetime.day.toString();
                      String datetimehour = datetime.hour < 10
                          ? "0${datetime.hour}"
                          : datetime.hour.toString();
                      String datetimeminute = datetime.minute < 0
                          ? "${datetime.minute}"
                          : datetime.minute.toString();

                      return FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 50, right: 50),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      mypost['image'],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      mypost['name'],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 50, right: 50),
                              child: mypost['uid'] == 'reklamidfisis'
                                  ? FrostedGlassView(
                                      theheight: 200,
                                      thewidth: 300,
                                      thechild: InkWell(
                                        onTap: () {
                                          final Uri url =
                                              Uri.parse(mypost['urllink']);
                                          _launchInWebViewOrVC(url);
                                        },
                                        child: SizedBox(
                                          height: 180,
                                          width: 280,
                                          child: Image.network(
                                              mypost['backgroundimage']),
                                        ),
                                      ),
                                    )
                                  : FrostedGlassView(
                                      theheight: 280,
                                      thewidth: 300,
                                      thechild: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 110,
                                            child: Text(
                                                "$datetimeyear-$datetimemonth-$datetimeday $datetimehour:$datetimeminute"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                bottom: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white
                                                      .withOpacity(0.20)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Icon(
                                                            Icons
                                                                .circle_rounded,
                                                            size: 30,
                                                            color: mypost[
                                                                        'color'] ==
                                                                    "Kırmızı"
                                                                ? Colors.red
                                                                : mypost['color'] ==
                                                                        "Turuncu"
                                                                    ? Colors
                                                                        .orange
                                                                    : mypost['color'] ==
                                                                            "Sarı"
                                                                        ? Colors
                                                                            .yellow
                                                                        : mypost['color'] ==
                                                                                "Yeşil"
                                                                            ? Colors.green
                                                                            : mypost['color'] == "Mavi"
                                                                                ? Colors.blue
                                                                                : mypost['color'] == "Lacivert"
                                                                                    ? Colors.blue.shade900
                                                                                    : Colors.purple,
                                                          ),
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              "${mypost['color']}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                      letterSpacing:
                                                                          3,
                                                                      fontSize:
                                                                          18),
                                                            )),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Icon(
                                                            Icons
                                                                .circle_rounded,
                                                            size: 30,
                                                            color: mypost[
                                                                        'color'] ==
                                                                    "Kırmızı"
                                                                ? Colors.red
                                                                : mypost['color'] ==
                                                                        "Turuncu"
                                                                    ? Colors
                                                                        .orange
                                                                    : mypost['color'] ==
                                                                            "Sarı"
                                                                        ? Colors
                                                                            .yellow
                                                                        : mypost['color'] ==
                                                                                "Yeşil"
                                                                            ? Colors.green
                                                                            : mypost['color'] == "Mavi"
                                                                                ? Colors.blue
                                                                                : mypost['color'] == "Lacivert"
                                                                                    ? Colors.blue.shade900
                                                                                    : Colors.purple,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imageanimal']}"),
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              "${mypost['animal']}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                      letterSpacing:
                                                                          3,
                                                                      fontSize:
                                                                          18),
                                                            )),
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imageanimal']}"),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imageplant']}"),
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              "${mypost['plant']}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                      letterSpacing:
                                                                          3,
                                                                      fontSize:
                                                                          18),
                                                            )),
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imageplant']}"),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imagerock']}"),
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              "${mypost['rock']}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                      letterSpacing:
                                                                          3,
                                                                      fontSize:
                                                                          18),
                                                            )),
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Image.network(
                                                                  "${mypost['imagerock']}"),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: SizedBox(
                                                  height: 60,
                                                  width: 150,
                                                  child: Text(
                                                    "${mypost['explain']}",
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    style: GoogleFonts.oswald(
                                                        textStyle:
                                                            const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white,
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: IconButton(
                                                    onPressed: () {
                                                      _favoriteSharesService
                                                          .addFavorite(
                                                        mypost['image'],
                                                        mypost['name'],
                                                        mypost['explain'],
                                                        DateTime.now()
                                                            .toString(),
                                                      );
                                                      String name = "";
                                                      if (mypost['uid'] ==
                                                          uid) {
                                                        setState(() {
                                                          name = 'Paylaşmınız';
                                                        });
                                                      } else {
                                                        name =
                                                            "${mypost['name']} kişisinin paylaşımı";
                                                      }
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "$name favorilere eklendi.")));
                                                    },
                                                    icon: Icon(
                                                      Icons.star_rounded,
                                                      color: customColor,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
