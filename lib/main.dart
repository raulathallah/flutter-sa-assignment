import 'package:flutter/material.dart';
import 'package:my_portofolio_app/components/appBar.dart';
import 'package:my_portofolio_app/providers/form_portfolio_providers.dart';
import 'package:my_portofolio_app/providers/portfolio_providers.dart';
import 'package:my_portofolio_app/providers/user_providers.dart';
import 'package:my_portofolio_app/screen/contact_me_screen.dart';
import 'package:my_portofolio_app/screen/my_portfolio_screen.dart';
import 'package:my_portofolio_app/screen/profile_screen.dart';
import 'package:my_portofolio_app/widgets/floating_buttons.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(
  //   ChangeNotifierProvider(create: (_) => UserProviders(), child: MyApp()),
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProviders()),
        ChangeNotifierProvider(create: (_) => FormPortfolioProviders()),
        ChangeNotifierProvider(create: (_) => PortfolioProviders()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  void _changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProviders>().user;
    List<Widget> _screens = [
      ProfileScreen(user: user),
      MyPortfolioScreen(),
      ContactMeScreen(user: user),
    ];
    final List<String> _titles = ['Profile', 'My Portfolio', 'Contact Me'];

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
      floatingActionButton: getFloatingButton(
        _currentIndex,
        _changeTab,
        context,
      ),
    );
  }
}
