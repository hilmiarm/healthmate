// function/user_profile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../data/user_profile.dart';
import '../data/user_profile_provider.dart';
import 'dart:io';
import '../styles/styles_user_profile.dart'; // Import the styles

class ProfileForm extends StatefulWidget {
  final UserProfile? userProfile;

  const ProfileForm({Key? key, this.userProfile}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  File? _profileImage;
  String _bmiResult = '';
  String _bmiCategory = '';
  List<String> _bmiAdvice = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with values from userProfile if available
    _nameController =
        TextEditingController(text: widget.userProfile?.name ?? '');
    _ageController =
        TextEditingController(text: widget.userProfile?.age.toString() ?? '');
    _weightController = TextEditingController(
        text: widget.userProfile?.weight.toString() ?? '');
    _heightController = TextEditingController(
        text: widget.userProfile?.height.toString() ?? '');
    _profileImage = widget.userProfile?.photoUrl != null
        ? File(widget.userProfile!.photoUrl!)
        : null;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      // Save profile photo to UserProfileProvider
      Provider.of<UserProfileProvider>(context, listen: false)
          .updateProfilePhoto(pickedFile.path);
    }
  }

  void _calculateBMI() {
    final double weight = double.parse(_weightController.text);
    final double height =
        double.parse(_heightController.text) / 100; // Convert cm to meters

    final double bmi = weight / (height * height);

    setState(() {
      _bmiResult = bmi.toStringAsFixed(1);
      if (bmi < 18.5) {
        _bmiCategory = 'Kurus';
        _bmiAdvice = [
          'Konsumsi makanan yang kaya kalori dan nutrisi.',
          'Makan lebih sering dengan porsi kecil.',
          'Tambahkan camilan sehat di antara waktu makan.',
          'Konsumsi protein dalam jumlah cukup.',
          'Latihan kekuatan untuk membangun otot.',
          'Hindari minuman berkalori kosong seperti soda.',
          'Pastikan tidur cukup setiap malam.'
        ];
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        _bmiCategory = 'Ideal';
        _bmiAdvice = [
          'Tubuhmu tergolong ideal, pertahankan dengan pola hidup sehat!'
        ];
      } else if (bmi >= 25 && bmi <= 29.9) {
        _bmiCategory = 'Overweight';
        _bmiAdvice = [
          'Kurangi konsumsi makanan tinggi gula dan lemak.',
          'Perbanyak konsumsi sayur dan buah.',
          'Tetapkan jadwal makan yang teratur.',
          'Tingkatkan aktivitas fisik seperti berjalan atau berenang.',
          'Hindari makan malam terlalu larut.',
          'Minum air putih yang cukup setiap hari.',
          'Konsultasikan dengan ahli gizi untuk rencana diet yang tepat.'
        ];
      } else {
        _bmiCategory = 'Obesitas';
        _bmiAdvice = [
          'Kurangi porsi makan dan hindari makanan tinggi kalori.',
          'Tetapkan target penurunan berat badan yang realistis.',
          'Lakukan olahraga secara teratur, seperti aerobik atau bersepeda.',
          'Konsultasikan dengan dokter atau ahli gizi untuk saran medis.',
          'Hindari makanan cepat saji dan minuman berkalori tinggi.',
          'Fokus pada makanan kaya serat, seperti sayuran dan biji-bijian.',
          'Jaga motivasi dengan mencatat perkembangan dan mencapai target kecil.'
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Enable scrolling for the form
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Center the CircleAvatar horizontally
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 100,
                backgroundColor:
                    Colors.white, // Set initial background color to white
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null, // Only set backgroundImage if a profile image is selected
                child: _profileImage == null
                    ? Icon(Icons.add_a_photo,
                        size: 75, color: Color.fromARGB(255, 0, 0, 30))
                    : null,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: kInputDecoration.copyWith(labelText: 'Nama'),
            style: kTextStyleWhite14,
          ),
          TextField(
            controller: _ageController,
            decoration: kInputDecoration.copyWith(labelText: 'Umur'),
            keyboardType: TextInputType.number,
            style: kTextStyleWhite14,
          ),
          TextField(
            controller: _weightController,
            decoration: kInputDecoration.copyWith(labelText: 'Berat Badan (kg)'),
            keyboardType: TextInputType.number,
            style: kTextStyleWhite14,
          ),
          TextField(
            controller: _heightController,
            decoration: kInputDecoration.copyWith(labelText: 'Tinggi Badan (cm)'),
            keyboardType: TextInputType.number,
            style: kTextStyleWhite14,
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Retrieve values from the fields and save them into UserProfile object
                final String name = _nameController.text;
                final int age = int.parse(_ageController.text);
                final double weight = double.parse(_weightController.text);
                final double height = double.parse(_heightController.text);

                final userProfile = UserProfile(
                  name: name,
                  age: age,
                  weight: weight,
                  height: height,
                  photoUrl: _profileImage?.path, // Save profile photo URL
                );

                // Use Provider to save profile data globally
                Provider.of<UserProfileProvider>(context, listen: false)
                    .setUserProfile(userProfile);

                // Calculate BMI
                _calculateBMI();
              },
              child: Text(
                'Simpan & Cek BMI',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 30),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          if (_bmiResult.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMI kamu = $_bmiResult',
                    style: kTextStyleWhite14,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tubuhmu tergolong $_bmiCategory',
                    style: kTextStyleWhite14,
                  ),
                  SizedBox(height: 20),
                  if (_bmiAdvice.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saran:',
                          style: kTextStyleWhite14.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        for (final advice in _bmiAdvice)
                          Text(
                            '• $advice',
                            style: kTextStyleWhite14,
                          ),
                      ],
                    ),
                ],
              ),
            ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
