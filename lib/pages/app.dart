import 'package:final_project/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/pages/auth_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Bokor')
        )
      ),
      home: AuthPage(),
    );
  }
}