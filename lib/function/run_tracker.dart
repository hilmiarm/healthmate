import 'dart:async';
import 'package:geolocator/geolocator.dart';

class RunTracker {
  List<Position> _positions = [];
  double _totalDistance = 0.0;
  Stopwatch _stopwatch = Stopwatch();
  String _elapsedTime = '00:00:00';
  Timer? _timer;
  bool trackingStarted = false;
  bool isRunning = false;

  String get elapsedTime => _elapsedTime;
  double get totalDistance => _totalDistance;

  void _updateElapsedTime() {
    _elapsedTime = _formatTime(_stopwatch.elapsed);
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void startTracking(void Function() updateUI) {
    trackingStarted = true;
    isRunning = true;
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _updateElapsedTime();
      updateUI();
    });

    Geolocator.getPositionStream().listen((Position position) {
      if (_positions.isNotEmpty) {
        double distance = Geolocator.distanceBetween(
          _positions.last.latitude,
          _positions.last.longitude,
          position.latitude,
          position.longitude,
        );
        _totalDistance += distance;
      }
      _positions.add(position);
      updateUI();
    });
  }

  void pauseTracking(void Function() updateUI) {
    _timer?.cancel();
    _stopwatch.stop();
    isRunning = false;
    updateUI();
  }

  void resumeTracking(void Function() updateUI) {
    isRunning = true;
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _updateElapsedTime();
      updateUI();
    });
  }

  void stopTracking(void Function() updateUI) {
    _timer?.cancel();
    _stopwatch.stop();
    _stopwatch.reset();
    _totalDistance = 0.0;
    _positions.clear();
    trackingStarted = false;
    isRunning = false;
    _updateElapsedTime();
    updateUI();
  }
}
