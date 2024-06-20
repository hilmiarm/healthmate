import 'package:flutter/material.dart';
import '../screen/screen_creator_profile.dart'; // Pastikan Anda mengimpor halaman profil creator

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'HealthMate',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 140, 155, 220), // Mengatur warna AppBar
      elevation: 4.0, // Menambahkan bayangan
      shadowColor: Color.fromARGB(255, 0, 0, 0), // Warna bayangan
      iconTheme: IconThemeData(
          color:
              Color.fromARGB(255, 255, 255, 255)), // Mengatur warna ikon AppBar
      actions: [
        IconButton(
          icon: Icon(Icons.error_outline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatorProfilePage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
