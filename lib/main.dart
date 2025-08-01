import 'package:flutter/material.dart';
import 'package:my_portofolio_app/models/user.dart';
import 'package:my_portofolio_app/screen/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User user = User(
    name: 'Dewi Lestari',
    profession: 'Graphic Designer',
    email: 'dewi.lestari@kreasi.id',
    phone: '+62 812-3456-7890',
    address: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    bio:
        "Desainer grafis dengan pengalaman lebih dari 6 tahun di industri kreatif, khususnya dalam bidang branding, ilustrasi digital, dan identitas visual. Memiliki kemampuan dalam mengelola proyek desain dari tahap konsep hingga eksekusi akhir, dengan perhatian tinggi terhadap detail dan estetika. Berpengalaman bekerja sama dengan berbagai startup, UMKM, dan agensi untuk menciptakan solusi visual yang kuat dan berkesan. Selain itu, memiliki ketertarikan besar pada seni digital, fotografi, dan eksplorasi gaya visual baru. Di waktu luang, senang menjelajahi inspirasi desain dari berbagai budaya sambil menikmati secangkir kopi hitam tanpa gula.",
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'My Portfolio',
      home: ProfileScreen(user: user),
    );
  }
}
