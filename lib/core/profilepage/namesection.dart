import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileNamePage extends StatefulWidget {
  const ProfileNamePage({Key? key}) : super(key: key);

  @override
  State<ProfileNamePage> createState() => _ProfileNamePageState();
}

class _ProfileNamePageState extends State<ProfileNamePage> {
  final AuthService _authService = AuthService();
  final TextEditingController namecontroller = TextEditingController();

  String? uid, name, email;

  @override
  void initState() {
    super.initState();
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        name = user?.displayName;
        email = user?.email;
      });
    });
  }

  String imagename = DateTime.now().toString();

  void picUpload() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 75,
    );

    Reference ref = FirebaseStorage.instance.ref().child('$imagename.png');

    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) {
      FirebaseFirestore.instance
          .collection('Person')
          .doc(uid)
          .update({'image': value.toString()});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Person')
          .where('email', isEqualTo: email)
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const CircularProgressIndicator()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot person = snapshot.data!.docs[index];

                  return SizedBox(
                    height: 150,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(person['image']),
                                  ),
                                ),
                                child: const Text(""),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {
                                      picUpload();
                                    },
                                    icon: const Icon(Icons.edit_rounded)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                Text(
                                  person['userName'].toString(),
                                  style: GoogleFonts.oswald(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text(
                                                    'İsminizi Güncelleyiniz.'),
                                                content: TextField(
                                                  controller: namecontroller,
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('İptal')),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        FirebaseAuth.instance
                                                            .currentUser!
                                                            .updateDisplayName(
                                                                namecontroller
                                                                    .text);
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Person')
                                                            .doc(uid)
                                                            .update({
                                                          'userName':
                                                              namecontroller
                                                                  .text
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Tamam'))
                                                ],
                                              ));
                                    },
                                    child: const Icon(Icons.edit_rounded)),
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
    );
  }
}
