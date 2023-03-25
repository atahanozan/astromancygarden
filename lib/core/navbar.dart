import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/discoverpage.dart';
import 'package:fortunetell/apppages/homepage.dart';
import 'package:fortunetell/apppages/wishcards.dart';
import 'package:fortunetell/core/animatedfab.dart';
import 'package:fortunetell/core/tabbarview.dart';
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

  int page = 0;

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
      floatingActionButton: const AnimatedFAB(),
      body: IndexedStack(index: page, children: const <Widget>[
        HomePage(),
        TarotPage(),
        DiscoverViewPage(),
        WishCardsPageView(),
        TabbarViewPage(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: page == 0
              ? Colors.blue.shade100
              : page == 1
                  ? Colors.green.shade100
                  : page == 2
                      ? Colors.amber.shade100
                      : Colors.purple.shade100,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          selectedItemColor: Colors.black87,
          // type: BottomNavigationBarType.fixed,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/gunlukicon.png")),
              label: "Günlük Fal",
              backgroundColor: const Color(0xFFBBDEFB),
            ),
            BottomNavigationBarItem(
                backgroundColor: const Color(0xFFC8E6C9),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/taroticon.png")),
                label: "Tarot Falı"),
            BottomNavigationBarItem(
                backgroundColor: const Color(0xFF424242),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/homeicon.png")),
                label: "Keşfet"),
            BottomNavigationBarItem(
                backgroundColor: const Color(0xFFFFECB3),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/sansicon.png")),
                label: "Dilek Kartları"),
            BottomNavigationBarItem(
                backgroundColor: const Color(0xFFE1BEE7),
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(customimageURL),
                ),
                label: "Profil"),
          ]),
    );
  }
}
