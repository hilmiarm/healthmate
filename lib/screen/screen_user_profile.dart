// screen/screen_user_profile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../universal/app_bar.dart';
import '../universal/navbar.dart';
import '../function/user_profile.dart';
import '../data/user_profile_provider.dart';
import '../styles/styles_user_profile.dart'; // Import the styles

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final userProfile = userProfileProvider.userProfile;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // Enable scrolling for the entire body
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Profil dan BMImu',
                style: kTextStyleBold,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: kBoxDecoration,
              child: ProfileForm(userProfile: userProfile),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 4),
    );
  }
}
