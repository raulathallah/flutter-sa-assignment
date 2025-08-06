import 'package:flutter/material.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const buildAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: null,
          ),
          Text(title, style: TextStyle(fontSize: 14)),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: null,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
