import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:google_fonts/google_fonts.dart';

class SignDetailsPage extends StatefulWidget {
  const SignDetailsPage({Key? key}) : super(key: key);

  @override
  State<SignDetailsPage> createState() => _SignDetailsPageState();
}

class _SignDetailsPageState extends State<SignDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: Text(
          'BURÇLAR',
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Signs').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Text('Yükleniyor')
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mysign = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              scrollable: true,
                              title: Text(mysign['sign']),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SignTile(
                                    header: 'Gezegen',
                                    mysign: mysign['planet'],
                                  ),
                                  SignTile(
                                    header: 'Element',
                                    mysign: mysign['element'],
                                  ),
                                  SignTile(
                                    header: 'Renk',
                                    mysign: mysign['colors'],
                                  ),
                                  SignTile(
                                    header: 'Doğal\nTaş',
                                    mysign: mysign['rock'],
                                  ),
                                  SignTile(
                                    header: 'Stil',
                                    mysign: mysign['style'],
                                  ),
                                  SignTile(
                                    header: 'Anlaştığı\nBurçlar',
                                    mysign: mysign['comman'],
                                  ),
                                  SignTile(
                                    header: 'Anlaşamadığı\nBurçlar',
                                    mysign: mysign['notcomman'],
                                  ),
                                  SignTile(
                                    header: '${mysign['sign']} Kadını',
                                    mysign: mysign['female'],
                                  ),
                                  SignTile(
                                    header: '${mysign['sign']} Erkeği',
                                    mysign: mysign['male'],
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Tamam'))
                              ],
                            ),
                          );
                        },
                        leading: Image.network(mysign['pic']),
                        title: Text(
                          mysign['sign'],
                          style: GoogleFonts.comfortaa(),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

class SignTile extends StatelessWidget {
  const SignTile({
    Key? key,
    required this.mysign,
    required this.header,
  }) : super(key: key);

  final String mysign;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              header,
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade900,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              mysign,
              style: GoogleFonts.comfortaa(),
            ),
          ),
        ],
      ),
    );
  }
}
