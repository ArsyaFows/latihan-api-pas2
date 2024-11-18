import 'package:flutter/material.dart';
import '../bottom_nav.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}