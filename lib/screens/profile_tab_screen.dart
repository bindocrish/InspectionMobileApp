import 'package:flutter/material.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Home', icon: Icon(Icons.home)),
              Tab(text: 'Profile', icon: Icon(Icons.person)),
              Tab(text: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
          TabBarView(
            controller: _tabController,
            children: [
              Center(child: Text('Home Screen')),
              Center(child: Text('Profile Screen')),
              Center(child: Text('Settings Screen')),
            ],
          ),
        ],
      ),
    );
  }
}
