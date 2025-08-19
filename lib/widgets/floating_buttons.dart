import 'package:flutter/material.dart';
import 'package:my_portofolio_app/screen/my_portfolio_form_screen.dart';

Widget? getFloatingButton(
  index,
  void Function(int) onTabChange,
  BuildContext context,
) {
  if (index == 0) {
    return ElevatedButton.icon(
      icon: Icon(Icons.message_rounded), // Your icon here
      label: Text('Contact Me'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        onTabChange(2);
      },
    );
  }

  if (index == 1) {
    return SizedBox(
      width: 50, // Make sure width == height
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Text('+', style: TextStyle(fontSize: 24)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MyPortfolioFormScreen()),
          );
        },
      ),
    );
  }

  return null;
}
