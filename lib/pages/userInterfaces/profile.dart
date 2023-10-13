import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _SearchPageState();
}

class _SearchPageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

   void signUserOut() {
    FirebaseAuth.instance.signOut();
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

  Widget _buildBody() {
    return Center(
      child: Text('ProfilePage'),
    );
  }

}