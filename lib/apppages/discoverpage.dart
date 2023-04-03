import 'package:animate_gradient/animate_gradient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:fortunetell/service/favorites_service.dart';
import 'package:fortunetell/service/sharestatus_service.dart';
import 'package:google_fonts/google_fonts.dart';

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

  String networkImage =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Text(
          "DISCOVERY",
          style: GoogleFonts.benchNine(
            fontSize: 25,
          ),
        ),
        automaticallyImplyLeading: false,
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
          image: AssetImage("assets/gecesonbg.png"),
          fit: BoxFit.cover,
        )),
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

                      return FittedBox(
                        fit: BoxFit.contain,
                        child: mypost['header'] == 'Günlük Burç Yorumu'
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 50, right: 50),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/aspics%2F2.png?alt=media&token=34dd3598-a32c-47a6-9ff4-fecc7ae6ded2",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            mypost['header'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 50,
                                        right: 50),
                                    child: FrostedGlassView(
                                      thewidth: 200,
                                      theheight: 200,
                                      thechild: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(
                                                mypost['datetime'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F1.png?alt=media&token=6a19bfce-faed-497c-9371-e536f1e07168",
                                                  title: 'Koç',
                                                  content: mypost['koc'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F2.png?alt=media&token=fb9929f6-8992-4156-ac94-c5b97b9ba9b9",
                                                  title: 'Boğa',
                                                  content: mypost['boga'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F3.png?alt=media&token=bd0b1af7-47b0-48fd-a3e4-8fd23aa52394",
                                                  title: 'İkizler',
                                                  content: mypost['ikizler'],
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F4.png?alt=media&token=0f93bfb7-f772-4792-9bb2-97a8324f1456",
                                                  title: 'Yengeç',
                                                  content: mypost['yengec'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F5.png?alt=media&token=7d7daaf0-e61c-42ab-a497-2ee5e78c9409",
                                                  title: 'Aslan',
                                                  content: mypost['aslan'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F6.png?alt=media&token=17dac802-76b3-4a3f-9b10-680b1716287d",
                                                  title: 'Başak',
                                                  content: mypost['basak'],
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F7.png?alt=media&token=74f1d678-c1f2-4215-9f7d-47029ab6d879",
                                                  title: 'Terazi',
                                                  content: mypost['terazi'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F8.png?alt=media&token=606e284d-f40c-4446-88ec-58ffc0e1eb5f",
                                                  title: 'Akrep',
                                                  content: mypost['akrep'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F9.png?alt=media&token=aaebbb66-c19f-43b3-9041-3df33349eedb",
                                                  title: 'Yay',
                                                  content: mypost['yay'],
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F10.png?alt=media&token=af9fa284-0f6f-4acb-8b35-c7ef0d0efbe3",
                                                  title: 'Oğlak',
                                                  content: mypost['oglak'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F11.png?alt=media&token=4ea29d4a-4c4a-4fd3-820e-8ffc4d661f83",
                                                  title: 'Kova',
                                                  content: mypost['kova'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/customsign%2F12.png?alt=media&token=208f6f3a-7efb-405e-9f0d-db13664a1407",
                                                  title: 'Balık',
                                                  content: mypost['balik'],
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 50, right: 50),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/aspics%2F3.png?alt=media&token=88267607-78d2-4159-85ec-9118fde7d4b5",
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            mypost['header'],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 50,
                                        right: 50),
                                    child: FrostedGlassView(
                                      thewidth: 200,
                                      theheight: 200,
                                      thechild: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(
                                                mypost['datetime'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                            Text(mypost['content'])
                                          ],
                                        ),
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

class SignCommand extends StatelessWidget {
  const SignCommand({
    Key? key,
    required this.pic,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String pic;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: -10,
                ),
              ],
            ),
            child: Image.network(pic),
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(pic),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                title,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Text(content),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tamam'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
