import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portofolio_app/models/user.dart';

class ContactMeScreen extends StatelessWidget {
  final User user;

  const ContactMeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                Column(
                  children: [
                    Text(
                      'Get in Touch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Have a question or want to collaborate? Let's connect and bring your ideas to life.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Card(
                  elevation: 4,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text(user.phone),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text(user.email),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Social Media',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.instagram,
                          size: 30,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 8),
                        Text('@raulathallah'),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.linkedin,
                          size: 30,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 8),
                        Text('raulathallah'),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.github,
                          size: 30,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 8),
                        Text('raulathallah'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
