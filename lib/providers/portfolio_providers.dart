import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portofolio_app/models/portfolio.dart';

class PortfolioProviders extends ChangeNotifier {
  final List<Portfolio> _portfolios = [];
  List<Portfolio> get portfolios => _portfolios;

  void addPortfolio(Portfolio newData) {
    _portfolios.add(newData);
    notifyListeners();
  }

  void deletePortfolio(int index) {
    _portfolios.removeAt(index);
    notifyListeners();
  }
}
