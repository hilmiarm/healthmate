// user_profile_provider.dart

import 'package:flutter/material.dart';
import 'user_profile.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile? _userProfile;

  // Getter for accessing profile data
  UserProfile? get userProfile => _userProfile;

  // Setter for changing profile data
  void setUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  // Method for updating profile photo
  void updateProfilePhoto(String photoUrl) {
    if (_userProfile != null) {
      _userProfile = UserProfile(
        name: _userProfile!.name,
        age: _userProfile!.age,
        weight: _userProfile!.weight,
        height: _userProfile!.height,
        photoUrl: photoUrl,
      );
      notifyListeners();
    }
  }
}
