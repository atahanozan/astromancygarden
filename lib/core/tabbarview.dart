import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/favorites_page.dart';
import 'package:fortunetell/apppages/oldshares.dart';
import 'package:fortunetell/apppages/profilepage.dart';

class TabbarViewPage extends StatefulWidget {
  const TabbarViewPage({Key? key}) : super(key: key);

  @override
  State<TabbarViewPage> createState() => _TabbarViewPageState();
}

class _TabbarViewPageState extends State<TabbarViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 15,
          backgroundColor: Colors.purple.shade100,
          bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.purple),
              tabs: const [
                Tab(
                  text: "Profil",
                ),
                Tab(
                  text: "Favoriler",
                ),
                Tab(
                  text: "Paylaşımlar",
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            ProfilePage(),
            FavoritesPageView(),
            OlsSharesPageView(),
          ],
        ),
      ),
    );
  }
}
