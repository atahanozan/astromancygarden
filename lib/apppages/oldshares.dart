import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/auth.dart';
import '../service/sharestatus_service.dart';

class OlsSharesPageView extends StatefulWidget {
  const OlsSharesPageView({super.key});

  @override
  State<OlsSharesPageView> createState() => _OlsSharesPageViewState();
}

class _OlsSharesPageViewState extends State<OlsSharesPageView> {
  final ShareStatusService _shareStatusService = ShareStatusService();
  final AuthService _authService = AuthService();
  double customheight = 0;

  String? uid, name;

  @override
  void initState() {
    super.initState();
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ShareStatus')
              .where('uid', isEqualTo: uid.toString())
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snapshot.data!.docs[index];

                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: const Text('Gönderiniz'),
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.purple.shade100),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Icon(
                                                        Icons.circle_rounded,
                                                        size: 10,
                                                        color: mypost[
                                                                    'color'] ==
                                                                "Kırmızı"
                                                            ? Colors.red
                                                            : mypost['color'] ==
                                                                    "Turuncu"
                                                                ? Colors.orange
                                                                : mypost['color'] ==
                                                                        "Sarı"
                                                                    ? Colors
                                                                        .yellow
                                                                    : mypost['color'] ==
                                                                            "Yeşil"
                                                                        ? Colors
                                                                            .green
                                                                        : mypost['color'] ==
                                                                                "Mavi"
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
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .oswald(
                                                                  fontSize: 12),
                                                        )),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Icon(
                                                        Icons.circle_rounded,
                                                        size: 10,
                                                        color: mypost[
                                                                    'color'] ==
                                                                "Kırmızı"
                                                            ? Colors.red
                                                            : mypost['color'] ==
                                                                    "Turuncu"
                                                                ? Colors.orange
                                                                : mypost['color'] ==
                                                                        "Sarı"
                                                                    ? Colors
                                                                        .yellow
                                                                    : mypost['color'] ==
                                                                            "Yeşil"
                                                                        ? Colors
                                                                            .green
                                                                        : mypost['color'] ==
                                                                                "Mavi"
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
                                                    const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imageanimal']}"),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${mypost['animal']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .oswald(
                                                                  fontSize: 12),
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imageanimal']}"),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imageplant']}"),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${mypost['plant']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .oswald(
                                                                  fontSize: 12),
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imageplant']}"),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imagerock']}"),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${mypost['rock']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .oswald(
                                                                  fontSize: 12),
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: Image.network(
                                                              "${mypost['imagerock']}"),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            mypost['explain'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Kapat',
                                                  style: TextStyle(
                                                      color: Colors.purple),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _shareStatusService
                                                      .removeStatus(mypost.id);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        'Gönderi Paylaşımlardan Kaldırıldı!'),
                                                  ));
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Sil',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                        },
                        child: SizedBox(
                          height: 120,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.purple.shade100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.circle_rounded,
                                              size: 10,
                                              color: mypost['color'] ==
                                                      "Kırmızı"
                                                  ? Colors.red
                                                  : mypost['color'] == "Turuncu"
                                                      ? Colors.orange
                                                      : mypost['color'] ==
                                                              "Sarı"
                                                          ? Colors.yellow
                                                          : mypost['color'] ==
                                                                  "Yeşil"
                                                              ? Colors.green
                                                              : mypost['color'] ==
                                                                      "Mavi"
                                                                  ? Colors.blue
                                                                  : mypost['color'] ==
                                                                          "Lacivert"
                                                                      ? Colors
                                                                          .blue
                                                                          .shade900
                                                                      : Colors
                                                                          .purple,
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                "${mypost['color']}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              )),
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.circle_rounded,
                                              size: 10,
                                              color: mypost['color'] ==
                                                      "Kırmızı"
                                                  ? Colors.red
                                                  : mypost['color'] == "Turuncu"
                                                      ? Colors.orange
                                                      : mypost['color'] ==
                                                              "Sarı"
                                                          ? Colors.yellow
                                                          : mypost['color'] ==
                                                                  "Yeşil"
                                                              ? Colors.green
                                                              : mypost['color'] ==
                                                                      "Mavi"
                                                                  ? Colors.blue
                                                                  : mypost['color'] ==
                                                                          "Lacivert"
                                                                      ? Colors
                                                                          .blue
                                                                          .shade900
                                                                      : Colors
                                                                          .purple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imageanimal']}"),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                "${mypost['animal']}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imageanimal']}"),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imageplant']}"),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                "${mypost['plant']}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imageplant']}"),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imagerock']}"),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                "${mypost['rock']}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.oswald(
                                                    fontSize: 12),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Image.network(
                                                    "${mypost['imagerock']}"),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
