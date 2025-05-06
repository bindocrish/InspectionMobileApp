import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inspection_app_mobile/screens/profile_tab_screen.dart';
import 'home_screen.dart';
import 'logout_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  Color bgColor = Colors.blue;

  String getPlatformInfo() {
    if (kIsWeb) {
      return 'Running on Web';
    } else if (Platform.isAndroid) {
      return 'Running on Android';
    } else if (Platform.isIOS) {
      return 'Running on iOS';
    } else if (Platform.isWindows) {
      return 'Running on Windows';
    } else if (Platform.isLinux) {
      return 'Running on Linux';
    } else if (Platform.isMacOS) {
      return 'Running on macOS';
    } else {
      return 'Unknown Platform';
    }
  }

  final List<Widget> _pages = [
    HomePage(),
    ProfileTabScreen(),
    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.white, child: Text("Settings screen")),
        ],
      ),
    ),
    LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.supervised_user_circle, size: 25),
          Icon(Icons.settings, size: 25),
          Icon(Icons.logout, size: 25),
        ],
        color: Colors.orange.shade300,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(getPlatformInfo())),
      body: _pages[_selectedIndex],
    );
  }
}
