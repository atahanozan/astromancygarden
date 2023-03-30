import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/discoverpage.dart';
import 'package:fortunetell/apppages/homepage.dart';
import 'package:fortunetell/apppages/moreapps.dart';
import 'package:fortunetell/apppages/profilepage.dart';
import 'package:fortunetell/apppages/wishcards.dart';
import 'package:fortunetell/core/animatedfab.dart';
import 'package:fortunetell/service/auth.dart';
import 'package:fortunetell/service/fluttermessaging.dart';
import '../apppages/tarotpage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String customimageURL =
      "https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/profilepic.png?alt=media&token=999968ad-aa14-4459-b2e9-9cadbb2bfae5";

  int page = 1;

  final AuthService _authService = AuthService();
  final FirebaseNotification _service = FirebaseNotification();

  String? uid, email;

  @override
  void initState() {
    super.initState();
    _service.connectNotification();
    _authService.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        email = user?.email;
      });
    });
    FirebaseFirestore.instance
        .collection('Person')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element.id == uid) {
          setState(() {
            customimageURL = element['image'];
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: page,
        children: const <Widget>[
          DiscoverViewPage(),
          MoreApps(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              page = value;
            });
          },
          backgroundColor: Colors.black.withOpacity(0.3),
          elevation: 0,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: page,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 50,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                width: 30,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(customimageURL),
                ),
              ),
              label: "",
            ),
          ]),
    );
  }
}
