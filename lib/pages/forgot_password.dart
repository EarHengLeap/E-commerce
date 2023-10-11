import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/my_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            content: Text("Please enter your email."),
          );
        },
      );
      return;
    }

    bool isEmailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    if (!isEmailValid) {
      showDialog(
        context: context,
        builder: (context) {
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            content: Text("Incorrect email."),
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context) {
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            content: Text("Password reset link sent! Check your email."),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Forgot Password",
        style: TextStyle(
          color: Color(0xFF00073FF),
        ),
      ),
      iconTheme: IconThemeData(color: Color(0xFF00073FF)),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SvgPicture.asset(
              'assets/images/forgot_password.svg',
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Enter Your Email and we will send you a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: 'Email',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              MyLoginButton(
                onTap: passwordReset,
                text: "Reset Password",
              )
            ],
          )
        ],
      ),
    );
  }
}
