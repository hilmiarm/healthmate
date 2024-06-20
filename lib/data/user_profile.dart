// user_profile.dart

class UserProfile {
  final String name;
  final int age;
  final double weight;
  final double height;
  final String? photoUrl; // Add photoUrl field

  UserProfile({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    this.photoUrl,
  });
}
