import 'package:flutter/material.dart';
import '../data/calorie_data.dart';
import '../data/calorie_entry.dart';
import '../universal/app_bar.dart';
import '../universal/navbar.dart';
import '../function/calorie_tracker.dart';
import '../styles/styles_calorie_tracker.dart';
import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class CalorieTrackerScreen extends StatefulWidget {
  @override
  _CalorieTrackerScreenState createState() => _CalorieTrackerScreenState();
}

class _CalorieTrackerScreenState extends State<CalorieTrackerScreen> {
  final CalorieTrackerFunctions _trackerFunctions = CalorieTrackerFunctions();

  @override
  void initState() {
    super.initState();
    _trackerFunctions.selectedDate = DateTime.now();
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _trackerFunctions.selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              '      Catat kalori Harianmu',
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: containerDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _trackerFunctions.foodNameController,
                          decoration: InputDecoration(
                            labelText: 'Nama Makanan/Minuman',
                            labelStyle: labelTextStyle,
                          ),
                          style: inputTextStyle,
                        ),
                        TextField(
                          controller: _trackerFunctions.calorieController,
                          decoration: InputDecoration(
                            labelText: 'Jumlah Kalori',
                            labelStyle: labelTextStyle,
                          ),
                          keyboardType: TextInputType.number,
                          style: inputTextStyle,
                        ),
                        DropdownButton<String>(
                          value: _trackerFunctions.selectedMealTime,
                          dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          onChanged: (String? newValue) {
                            setState(() {
                              _trackerFunctions.selectedMealTime = newValue!;
                            });
                          },
                          items: <String>[
                            'Sarapan',
                            'Makan Siang',
                            'Makan Malam'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: inputTextStyle,
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Tanggal: ${DateFormat.yMd().format(_trackerFunctions.selectedDate)}",
                                style: inputTextStyle,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 140, 155, 220)),
                              onPressed: () => _trackerFunctions.selectDate(context, _onDateSelected),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: 
                          ElevatedButton(
                            onPressed: () => _trackerFunctions.addCalorieEntry(context),
                            child: Text('Catat', style: inputTextStyle),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Catatan Kalorimu',
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: containerDecoration,
                    child: StreamBuilder<List<CalorieEntry>>(
                      stream: CalorieData().getCalorieEntries(_trackerFunctions.selectedDate),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('Tidak ada catatan kalori untuk tanggal ini', style: inputTextStyle);
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Tanggal: ${DateFormat.yMd().format(_trackerFunctions.selectedDate)}",
                                    style: inputTextStyle,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today, color: Color.fromARGB(255, 140, 155, 220)),
                                  onPressed: () => _trackerFunctions.selectDate(context, _onDateSelected),
                                ),
                              ],
                            ),
                            ...snapshot.data!.map((entry) => ListTile(
                              title: Text(entry.foodName, style: inputTextStyle),
                              subtitle: Text('${entry.calorie} Kalori - ${entry.mealTime}', style: inputTextStyle),
                            )).toList(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 2),
    );
  }
}
