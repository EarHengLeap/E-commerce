import 'package:final_project/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'userInterfaces/main_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in 
          if(snapshot.hasData) {
            return MainScreen();
          }
          //use is not logged in 
          else {
            return LoginOrRegister();
          }
        },
      )
    );
  }
}