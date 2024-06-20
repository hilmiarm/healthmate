// lib/screen/screen_creator_profile.dart
import 'package:flutter/material.dart';
import '../styles/styles_creator_profile.dart';

class CreatorProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Kami',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 140, 155, 220),
        elevation: 4.0, 
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('creator1.jpg'),
              ),
              SizedBox(height: 10),
              Text('Rahyan Cahyo Adji N.', style: CreatorProfileStyles.nameStyle),
              SizedBox(height: 5),
              Text(
                'Sistem Informasi, UPN "Veteran" Jawa Timur',
                style: CreatorProfileStyles.infoStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildInfoRow(Icons.cake, 'Jakarta, 9 Januari 2004'),
              _buildInfoRow(Icons.home, 'Tengaran, Peterongan, Kabupaten Jombang'),
              _buildInfoRow(Icons.phone, '+62 857 3099 8765'),
              _buildInfoRow(Icons.email, 'ami662744@gmail.com'),
              _buildInfoRow(Icons.code, 'https://github.com/Rayhannugroho?tab=repositories'),
              _buildInfoRow(Icons.school, 'SMA Negeri Mojoagung\nSMP Negeri 1 Peterongan\nSD Negeri 2 Tengaran'),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('creator2.jpg'),
              ),
              SizedBox(height: 10),
              Text('Hilmi Arya Rafwa M.', style: CreatorProfileStyles.nameStyle),
              SizedBox(height: 5),
              Text(
                'Sistem Informasi, UPN "Veteran" Jawa Timur',
                style: CreatorProfileStyles.infoStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildInfoRow(Icons.cake, 'Surabaya, 14 Januari 2004'),
              _buildInfoRow(Icons.home, 'Sukolilo Baru, Bulak, Kota Surabaya'),
              _buildInfoRow(Icons.phone, '+62 895 1833 7050'),
              _buildInfoRow(Icons.email, 'hilmi.arya2006@gmail.com'),
              _buildInfoRow(Icons.code, 'https://github.com/hilmiarm'),
              _buildInfoRow(Icons.school, 'SMA Negeri 8 Surabaya\nSMP Negeri 2 Surabaya\nSD Hang Tuah 3 Surabaya'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Padding(
      padding: CreatorProfileStyles.infoPadding,
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: Text(info, style: CreatorProfileStyles.infoStyle),
          ),
        ],
      ),
    );
  }
}
