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
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/aspics%2F2.png?alt=media&token=34dd3598-a32c-47a6-9ff4-fecc7ae6ded2",
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
                                            Expanded(
                                                child: Row(
                                              children: [
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F1.png?alt=media&token=35754344-0317-47d4-96c2-740ab4571004',
                                                  title: 'Koç',
                                                  content: mypost['koc'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F2.png?alt=media&token=1821ffe7-0a85-4976-995e-12a3453ea31b',
                                                  title: 'Boğa',
                                                  content: mypost['boga'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F3.png?alt=media&token=cc466a48-9157-4557-ac39-4150cccfb027',
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
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F4.png?alt=media&token=8225c04a-410c-4742-817a-ae7c9a313230',
                                                  title: 'Yengeç',
                                                  content: mypost['yengec'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F5.png?alt=media&token=dbbb22e7-73a9-41d8-8841-687e82aeeaca',
                                                  title: 'Aslan',
                                                  content: mypost['aslan'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F6.png?alt=media&token=5397fd8c-8ecf-4f61-b4e9-5f4859db1d90',
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
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F7.png?alt=media&token=2ee3bbf3-a08e-4f6b-8a78-341426385295',
                                                  title: 'Terazi',
                                                  content: mypost['terazi'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F8.png?alt=media&token=fddf1d66-000c-462a-8183-e0d6a421af0a',
                                                  title: 'Akrep',
                                                  content: mypost['akrep'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F9.png?alt=media&token=8f713342-26a7-4f28-bfbd-3a54d21bb46f',
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
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F10.png?alt=media&token=739067aa-26de-4fa1-8201-d5cf3e632c08',
                                                  title: 'Oğlak',
                                                  content: mypost['oglak'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F11.png?alt=media&token=173b72de-4a65-4547-b749-d227d5537349',
                                                  title: 'Kova',
                                                  content: mypost['kova'],
                                                ),
                                                SignCommand(
                                                  pic:
                                                      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/signs%2F12.png?alt=media&token=ef62273c-38c1-4b89-a495-006a58f97f7e',
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
        child: Image.network(pic),
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
