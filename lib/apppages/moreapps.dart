import 'package:flutter/material.dart';
import 'package:fortunetell/core/frotedglass.dart';
import 'package:fortunetell/core/infobutton.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreApps extends StatefulWidget {
  const MoreApps({Key? key}) : super(key: key);

  @override
  State<MoreApps> createState() => _MoreAppsState();
}

class _MoreAppsState extends State<MoreApps> {
  final String pageComment =
      'Falcı ile iltişim, Rüya tabirleri ve çok daha fazlasına bu sayfadan ulaşabilirsiniz.';
  final String imgDream =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Fdream.png?alt=media&token=fe1fc093-f5ea-456b-a497-70eff93deb5f';
  final String imgMessage =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Fmessage.png?alt=media&token=1fb0b1e5-5f59-42a1-a309-c117381cb8b8';
  final String imgAboutus =
      'https://firebasestorage.googleapis.com/v0/b/astromancygarden-30f3e.appspot.com/o/moreapps%2Faboutus.png?alt=media&token=d7c4c0e5-59e6-466f-b0a6-f4265788332e';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'ASTROMANCY GARDEN',
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/gecesonbg.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 50,
            top: 100,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButton(
                      name: 'Günlük Fal',
                      imgname: 'assets/bottomnavbaritems/clear.png',
                      btnaction: () {},
                    ),
                    MenuButton(
                      name: 'Dilek Kartı',
                      imgname: 'assets/bottomnavbaritems/lamba.png',
                      btnaction: () {},
                    ),
                    MenuButton(
                      name: 'Burçlar',
                      imgname: 'assets/bottomnavbaritems/cark.png',
                      btnaction: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButton(
                      name: 'Tarot Falı',
                      imgname: 'assets/bottomnavbaritems/cards.png',
                      btnaction: () {},
                    ),
                    MenuButton(
                      name: 'Rüya Tabirleri',
                      imgname: 'assets/bottomnavbaritems/zzz.png',
                      btnaction: () {},
                    ),
                    MenuButton(
                      name: 'Mesaj',
                      imgname: 'assets/bottomnavbaritems/zarf.png',
                      btnaction: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButton(
                      name: 'Hakkımızda',
                      imgname: 'assets/bottomnavbaritems/insanlar.png',
                      btnaction: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.name,
    required this.imgname,
    required this.btnaction,
  }) : super(key: key);

  final String name;
  final String imgname;
  final VoidCallback btnaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        btnaction;
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FrostedGlassView(
            thewidth: 110,
            theheight: 110,
            thechild: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(imgname),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.comfortaa(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
