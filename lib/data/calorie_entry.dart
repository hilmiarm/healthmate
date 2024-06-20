import 'package:cloud_firestore/cloud_firestore.dart';

class CalorieEntry {
  final String foodName;
  final String calorie;
  final String mealTime;
  final DateTime date;

  CalorieEntry({
    required this.foodName,
    required this.calorie,
    required this.mealTime,
    required this.date,
  });

  // From Map (Firebase Document to CalorieEntry)
  factory CalorieEntry.fromMap(Map<String, dynamic> data) {
    return CalorieEntry(
      foodName: data['foodName'] ?? '',
      calorie: data['calorie'] ?? '',
      mealTime: data['mealTime'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  // To Map (CalorieEntry to Firebase Document)
  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'calorie': calorie,
      'mealTime': mealTime,
      'date': date,
    };
  }
}
