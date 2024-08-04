import 'package:captainneuro/pages/const.dart';
import 'package:captainneuro/pages/geminichat.dart';
import 'package:captainneuro/pages/home.dart';
import 'package:captainneuro/pages/settings.dart';
import 'package:flutter/material.dart';

class NavbarPage extends StatefulWidget {
  NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _pageIndex = 0;

  final List _pages = [
    HomePage(),
    GeminiChatPage(),
    SettingsPage(),
    //LoginScreen(),
  ];

  final List _pageTitles = ["H O M E", "A I  A S S I S T", "S E T T I N G S"];

  final List _pageIcons = [Icons.home, Icons.help, Icons.settings];

  void updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  // Unused
  List<Widget> getNavItems() {
    List<Widget> list = <Widget>[];
    list.add(DrawerHeader(
        child: Icon(
      Icons.home,
      size: 20,
    )));
    for (int index = 0; index < _pages.length; index++) {
      list.add(ListTile(
        leading: _pageIcons[index],
        title: Text(_pageTitles[index]),
        selected: _pageIndex == index,
        onTap: () {
          Navigator.pop(context);
          updatePageIndex(index);
        },
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "C A P T A I N   N E U R O",
          style: TextStyle(color: ColorConstants.textColorPrimary),
        ),
        backgroundColor: ColorConstants.bgColorPrimary,
        actions: [
          Icon(Icons.person, color: ColorConstants.textColorPrimary),
          Icon(Icons.logout, color: ColorConstants.textColorPrimary)
        ],
      ),
      body: _pages[_pageIndex],
      drawer: Drawer(
        backgroundColor: ColorConstants.bgColorPrimary,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "images/playstore.png",
                width: 50,
                height: 50,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: ColorConstants.textColorPrimary),
              title: Text("H O M E",
                  style: TextStyle(color: ColorConstants.textColorPrimary)),
              selected: _pageIndex == 0,
              onTap: () {
                Navigator.pop(context);
                updatePageIndex(0);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.handshake, color: ColorConstants.textColorPrimary),
              title: Text("A I  A S S I S T",
                  style: TextStyle(color: ColorConstants.textColorPrimary)),
              selected: _pageIndex == 1,
              onTap: () {
                Navigator.pop(context);
                updatePageIndex(1);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.settings, color: ColorConstants.textColorPrimary),
              title: Text("S E T T I N G S",
                  style: TextStyle(color: ColorConstants.textColorPrimary)),
              selected: _pageIndex == 2,
              onTap: () {
                Navigator.pop(context);
                updatePageIndex(2);
              },
            )
          ],
        ),
      ),
    );
  }
}
