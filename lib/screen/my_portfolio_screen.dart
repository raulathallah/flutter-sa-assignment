import 'package:flutter/material.dart';

class MyPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: buildListPortfolio(),
        ),
      ),
    );
  }
}

Widget buildListPortfolio() {
  final List<dynamic> items = [
    {
      'title': 'HealthCare Appointment Management System',
      'description':
          'A simple app for managing appointments between patients and doctors. Patients can book and track visits easily, while doctors manage schedules and requests in real time — improving communication and reducing wait times.',
      'techStack': 'Codeigniter, TailwindCSS, PostgreSQL',
      'icon': Icons.health_and_safety,
    },
    {
      'title': 'AsriCompany Web Career & Management System',
      'description':
          'ASRI Web Career & Management System is a web-based platform that connects job seekers with employers. Applicants can apply for various jobs, while companies can post and manage their vacancies directly.',
      'techStack': '.NET Core, React',
      'icon': Icons.work,
    },
    {
      'title': 'Medix Mobile Health Tracker (Dummy)',
      'description':
          'Medix is a mobile app that helps users monitor their daily health stats, track medication schedules, and receive personalized health tips. Designed for ease of use and accessibility.',
      'techStack': 'Flutter, Firebase, REST API',
      'icon': Icons.phone_android,
    },
    {
      'title': 'EduConnect Online Learning Platform (Dummy)',
      'description':
          'EduConnect is an e-learning web application that enables students to access courses, join live sessions, and submit assignments. Instructors can manage content and track student progress in real time.',
      'techStack': 'Laravel, Vue.js, MySQL',
      'icon': Icons.school,
    },
  ];

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(items[index]['icon'], size: 40),
              SizedBox(height: 10),
              Text(
                items[index]['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 10),
              Text(items[index]['description']),
              SizedBox(height: 10),
              Text('Tech Stack: ${items[index]['techStack']}'),
            ],
          ),
        ),
      );
    },
  );
}
