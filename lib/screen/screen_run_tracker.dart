import 'package:flutter/material.dart';
import '../function/run_tracker.dart';
import '../universal/app_bar.dart';
import '../universal/navbar.dart';
import '../styles/styles_run_tracker.dart';

class RunTrackerScreen extends StatefulWidget {
  @override
  _RunTrackerScreenState createState() => _RunTrackerScreenState();
}

class _RunTrackerScreenState extends State<RunTrackerScreen> {
  RunTracker _runTracker = RunTracker();

  @override
  void initState() {
    super.initState();
  }

  void _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Run Tracker',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: runTrackerBoxDecoration,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Waktu',
                    style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    _runTracker.elapsedTime,
                    style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 140, 170, 225)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: runTrackerBoxDecoration,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Jarak',
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    '${_runTracker.totalDistance.toStringAsFixed(2)} m',
                    style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 140, 170, 225)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 40),
            _buildButtonSection(),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 1),
    );
  }

  Widget _buildButtonSection() {
    if (!_runTracker.trackingStarted) {
      return _buildStartButton();
    } else if (_runTracker.isRunning) {
      return _buildPauseButton();
    } else {
      return _buildResumeResetButtons();
    }
  }

  Widget _buildStartButton() {
    
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(60.0),
        child: ElevatedButton(
          onPressed: () {
            _runTracker.startTracking(_updateUI);
          },
          child: Text('Mulai'),
          style: runTrackerButtonStyle,
        ),
      ),
    );
  }

  Widget _buildPauseButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(60.0),
        child: ElevatedButton(
          onPressed: () {
            _runTracker.pauseTracking(_updateUI);
          },
          child: Text('Jeda'),
          style: runTrackerButtonStyle,
        ),
      ),
    );
  }

  Widget _buildResumeResetButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60.0),
              child: ElevatedButton(
                onPressed: () {
                  _runTracker.resumeTracking(_updateUI);
                },
                child: Text('Lanjutkan'),
                style: runTrackerButtonStyle,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60.0),
              child: ElevatedButton(
                onPressed: () {
                  _runTracker.stopTracking(_updateUI);
                },
                child: Text('Reset'),
                style: runTrackerButtonStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _runTracker.stopTracking(_updateUI);
    super.dispose();
  }
}
