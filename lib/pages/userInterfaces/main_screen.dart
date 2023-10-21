import 'package:final_project/controllers/mainscreen_provider.dart';
import 'package:final_project/pages/shared/bottom_nav_bar.dart';
import 'package:final_project/pages/userInterfaces/cart_page.dart';
import 'package:final_project/pages/userInterfaces/home_page.dart';
import 'package:final_project/pages/userInterfaces/profile.dart';
import 'package:final_project/pages/userInterfaces/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList =  [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
                  
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
