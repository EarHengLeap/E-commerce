import 'package:final_project/controllers/mainscreen_provider.dart';
import 'package:final_project/pages/userInterfaces/cart_page.dart';
import 'package:final_project/pages/userInterfaces/profile.dart';
import 'package:final_project/pages/userInterfaces/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bottom_nav_bar.dart';
import 'home_page.dart';


class MainScreen extends StatelessWidget {
  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];
  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }

 

  Widget _buildBody() {
    return Consumer<MainScreenNotifier> (
      builder: (context, mainScreenNotifier, child) {
        return pageList[mainScreenNotifier.pageIndex];
      },
    );
  }
}

