import 'package:flutter/material.dart';
import 'package:my_portofolio_app/models/user.dart';

class BuildProfileHeader extends StatelessWidget {
  final User user;

  const BuildProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
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
}

class BuildProfileInfo extends StatelessWidget {
  final User user;

  const BuildProfileInfo({required this.user});

  @override
  Widget build(BuildContext context) {
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
}

class BuildProfileBio extends StatelessWidget {
  final User user;

  const BuildProfileBio({required this.user});
  @override
  Widget build(BuildContext context) {
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
}
