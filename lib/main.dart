import 'package:flutter/material.dart';
import 'package:my_portofolio_app/components/appBar.dart';
import 'package:my_portofolio_app/models/user.dart';
import 'package:my_portofolio_app/screen/contact_me_screen.dart';
import 'package:my_portofolio_app/screen/my_portfolio_screen.dart';
import 'package:my_portofolio_app/screen/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'My Portfolio',
      //home: ProfileScreen(user: user),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  User get user => User(
    name: 'Raul Athallah',
    profession: 'IT Developer',
    email: 'raulathallah24@gmail.com',
    phone: '+62 812-3xxx-7xxx',
    address: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    bio:
        "Hi, I'm Raul — a Mobile Developer passionate about creating smooth, user-focused mobile experiences. I enjoy turning ideas into polished apps and constantly strive to write clean, maintainable code that performs well across platforms.",
  );

  void _changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  List<Widget> get _screens => [
    ProfileScreen(user: user),
    MyPortfolioScreen(),
    ContactMeScreen(user: user),
  ];
  final List<String> _titles = ['Profile', 'My Portfolio', 'Contact Me'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _titles[_currentIndex]),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: 'My Protfolio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
        ],
      ),
      floatingActionButton: _currentIndex != 0
          ? null
          : ElevatedButton.icon(
              icon: Icon(Icons.message_rounded), // Your icon here
              label: Text('Contact Me'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  // 👈 Custom radius here
                ),
              ),
              onPressed: () {
                _changeTab(2);
              },
            ),
    );
  }
}
