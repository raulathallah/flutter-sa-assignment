import 'package:flutter/material.dart';
import 'package:my_portofolio_app/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                buildProfileHeader(user, context),
                buildProfileBio(user),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildProfileHeader(User user, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Radius here
          image: DecorationImage(
            image: AssetImage('assets/images/pp_raul.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            user.profession,
            style: TextStyle(fontSize: 14, color: Colors.teal),
          ),
        ],
      ),
      SizedBox(height: 15),
    ],
  );
}

Widget buildProfileInfo(User user) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //EMAIL
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14,
              child: Icon(Icons.email, color: Colors.teal, size: 16),
            ),
            Divider(indent: 12),
            Text(
              user.email,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 12),
        //PHONE
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14,
              child: Icon(Icons.phone, color: Colors.teal, size: 16),
            ),
            Divider(indent: 12),
            Text(
              user.phone,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Divider(indent: 6),
            Text(user.phone, style: TextStyle(color: Colors.teal)),
          ],
        ),
        SizedBox(height: 12),
        //ADDRESS
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14,
              child: Icon(
                Icons.location_on_sharp,
                color: Colors.teal,
                size: 16,
              ),
            ),
            Divider(indent: 12),
            Text(user.address, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}

Widget buildProfileBio(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      Text(
        user.bio,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14),
      ),
    ],
  );
}
