import 'package:flutter/foundation.dart';
import 'package:my_portofolio_app/models/user.dart';

class UserProviders extends ChangeNotifier {
  final User _user = User(
    name: 'Raul Athallah',
    profession: 'IT Developer',
    email: 'raulathallah24@gmail.com',
    phone: '+62 812-3xxx-7xxx',
    address: 'Jakarta',
    bio:
        "Hi, I'm Raul — a Mobile Developer passionate about creating smooth, user-focused mobile experiences. I enjoy turning ideas into polished apps and constantly strive to write clean, maintainable code that performs well across platforms.",
  );

  User get user => _user;

  void updateName(String name) {
    _user.name = name;
    notifyListeners();
  }

  void updatePosition(String position) {
    _user.profession = position;
    notifyListeners();
  }

  void updateLocation(String location) {
    _user.address = location;
    notifyListeners();
  }
}
