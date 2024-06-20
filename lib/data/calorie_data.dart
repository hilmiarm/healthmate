import 'package:cloud_firestore/cloud_firestore.dart';
import 'calorie_entry.dart';

class CalorieData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CalorieEntry>> getCalorieEntries(DateTime selectedDate) {
    return _firestore
        .collection('calorie_entries')
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CalorieEntry.fromMap(doc.data())).toList());
  }

  Future<void> addEntry(CalorieEntry entry) async {
    await _firestore.collection('calorie_entries').add(entry.toMap());
  }
}
