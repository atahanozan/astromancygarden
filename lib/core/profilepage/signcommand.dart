import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';

class SignCommendsSate extends StatefulWidget {
  const SignCommendsSate({Key? key}) : super(key: key);

  @override
  State<SignCommendsSate> createState() => _SignCommendsSateState();
}

class _SignCommendsSateState extends State<SignCommendsSate> {
  final AuthService _authService = AuthService();

  String? uid, name, sign, email, gender;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
      });
    });
    FirebaseFirestore.instance
        .collection('Status')
        .where('uid', isEqualTo: uid.toString())
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var docs in querySnapshot.docs) {
        setState(() {
          sign = docs['sign'].toString();
          gender = docs['gender'].toString();
        });
      }
    });
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Signs')
            .where('sign', isEqualTo: sign)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Text(
                  'Hesaplanıyor...',
                  style: TextStyle(color: Colors.green),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot special = snapshot.data!.docs[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            special['sign'],
                            style: TextStyle(
                                fontSize: 18, color: Colors.amber.shade800),
                          ),
                        ),
                        _listTile(
                          special: special['element'],
                          text: 'Element',
                        ),
                        _listTile(
                          special: special['planet'],
                          text: 'Gezegen',
                        ),
                        _listTile(
                          special: special['rock'],
                          text: 'Doğal Taş',
                        ),
                        _listTile(
                          special: special['colors'],
                          text: 'Renk',
                        ),
                        _listTile(
                          special: special['comman'],
                          text: 'Anlaştığı Burçlar',
                        ),
                        _listTile(
                          special: special['notcomman'],
                          text: 'Anlaşamadığı Burçlar',
                        ),
                        _listTile(
                          special: special['style'],
                          text: 'Tarz',
                        ),
                        _listTile(
                          special: gender == 'Kadın'
                              ? special['female']
                              : special['male'],
                          text: gender == 'Kadın'
                              ? '${special['sign']} Kadını'
                              : '${special['sign']} Erkeği',
                        ),
                      ],
                    );
                  });
        });
  }
}

class _listTile extends StatelessWidget {
  const _listTile({
    Key? key,
    required this.special,
    required this.text,
  }) : super(key: key);

  final String special;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.pink),
      ),
      subtitle: Text(
        special,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
