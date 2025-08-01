import 'package:flutter/material.dart';
import 'package:my_portofolio_app/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 14)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                BuildProfileHeader(user),
                SizedBox(height: 16),
                BuildProfileInfo(user),
                SizedBox(height: 16),
                BuildProfileBio(user),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: null,
        backgroundColor: Colors.teal[200],
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
        ],
      ),
    );
  }
}

Widget BuildProfileHeader(User user) {
  return Column(
    children: [
      CircleAvatar(
        radius: 48,
        backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
      ),
      SizedBox(height: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(user.profession, style: TextStyle(fontSize: 12)),
        ],
      ),
    ],
  );
}

Widget BuildProfileInfo(User user) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.teal[200],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //EMAIL
        Row(
          children: [
            Icon(Icons.email_outlined, color: Colors.white),
            Divider(indent: 6),
            Text(user.email, style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 12),
        //PHONE
        Row(
          children: [
            Icon(Icons.phone_outlined, color: Colors.white),
            Divider(indent: 6),
            Text(user.phone, style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 12),
        //ADDRESS
        Row(
          children: [
            Icon(Icons.location_pin, color: Colors.white),
            Divider(indent: 6),
            Text(user.address, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}

Widget BuildProfileBio(User user) {
  return Column(
    children: [
      Text(
        'About Me',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      Text(user.bio, textAlign: TextAlign.justify),
    ],
  );
}
