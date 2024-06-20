import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/calorie_entry.dart';
import '../data/calorie_data.dart';

class CalorieTrackerFunctions {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController calorieController = TextEditingController();
  String selectedMealTime = 'Sarapan';
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  Future<void> addCalorieEntry(BuildContext context) async {
    final foodName = foodNameController.text;
    final calorie = calorieController.text;

    if (foodName.isEmpty || calorie.isEmpty) {
      return;
    }

    final entry = CalorieEntry(
      foodName: foodName,
      calorie: calorie,
      mealTime: selectedMealTime,
      date: selectedDate,
    );

    await CalorieData().addEntry(entry);

    foodNameController.clear();
    calorieController.clear();
  }
}
