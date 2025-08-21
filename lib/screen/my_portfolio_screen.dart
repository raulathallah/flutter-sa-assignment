import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_portofolio_app/models/portfolio.dart';
import 'package:my_portofolio_app/providers/portfolio_providers.dart';
import 'package:provider/provider.dart';

class MyPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: buildListPortfolio(context),
        ),
      ),
    );
  }
}

Widget buildListPortfolio(BuildContext context) {
  final portfolioProvider = context.watch<PortfolioProviders>();
  final items = portfolioProvider.portfolios;

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
              Image.file(
                File(items[index].projectImage!),
                height: 140,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              Text(
                items[index].projectTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 10),
              Text(items[index].description),
              SizedBox(height: 10),
              customTile(
                "Completion Date:",
                DateFormat('d MMMM yyyy').format(items[index].completionDate!),
              ),
              SizedBox(height: 10),
              customTile("Project Link:", items[index].projectLink),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      portfolioProvider.deletePortfolio(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[50],
                          content: Text(
                            'Portfolio item deleted!',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget customTile(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(value),
    ],
  );
}
