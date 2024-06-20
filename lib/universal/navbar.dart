import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  CustomNavBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run),
          label: 'Run Tracker',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Catat Kalori',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Artikel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil & BMI',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor:
          Color.fromARGB(255, 140, 170, 225), // Warna ikon yang dipilih
      unselectedItemColor: const Color.fromARGB(
          255, 128, 128, 128), // Warna ikon yang tidak dipilih
      selectedLabelStyle: TextStyle(
        fontSize: 12, // Ukuran teks yang dipilih
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12, // Ukuran teks yang tidak dipilih
      ),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/run_tracker');
            break;
          case 2:
            Navigator.pushNamed(context, '/calorie_tracker');
            break;
          case 3:
            Navigator.pushNamed(context, '/articles');
            break;
          case 4:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
