import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth_service.dart';
import 'square_title.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  Register({Key? key, this.onTap}) : super(key: key);

  @override
  State<Register> createState() => _LoginPageState();
}

class _LoginPageState extends State<Register> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // login user method
void signUserIn() async {
  // Show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Check if passwords match
  if (passwordController.text == confirmPasswordController.text) {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); 
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); 
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message ?? 'An error occurred.'),
          );
        },
      );
    }
  } else {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        final dialog = AlertDialog(
          content: const Text('Password do not match.'),
        );
        Timer(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });

        return dialog;
      },
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(
                'assets/images/register.svg',
                height: 150,
              ),
              const SizedBox(height: 50),
              Text(
                'Let\'s Create an Account',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // login button
              MyLoginButton(
                text: "Sign Up",
                onTap: signUserIn,
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTitle(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'assets/images/google_icon.png',
                  ),
                  const SizedBox(width: 10),
                  SquareTitle(
                    onTap: () {},
                    imagePath: 'assets/images/x.png',
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Signin now',
                      style: TextStyle(
                        color: Color(0xFF00073FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
