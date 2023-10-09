import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
final user = FirebaseAuth.instance.currentUser;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'ធ្វេីលេង',
        style: TextStyle(
          fontFamily: 'Bokor',
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.logout),
        )
      ],
    );
  }
  
    void signUserOut() {
      FirebaseAuth.instance.signOut();
    }

    Widget _buildBody() {
      return Center(
        child: Text(
          'Welcome ${user?.email}',
        ),
      );
    }
}