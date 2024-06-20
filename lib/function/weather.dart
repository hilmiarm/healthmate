import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<List<String>> fetchProvinces() async {
    final response = await http
        .get(Uri.parse('https://weather-api-tau-six.vercel.app/provinces'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> provinceList = data['data'];
      return provinceList.map((province) => province['id'] as String).toList();
    } else {
      throw Exception('Failed to load provinces');
    }
  }

  Future<List<String>> fetchCities(String provinceId) async {
    final response = await http.get(Uri.parse(
        'https://weather-api-tau-six.vercel.app/weather/$provinceId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> cityList = data['data']['forecast']['area'];
      return cityList.map((city) => city['description'] as String).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<Weather> fetchWeather(String provinceId, String cityId) async {
    final response = await http.get(Uri.parse(
        'https://weather-api-tau-six.vercel.app/weather/$provinceId?id=$cityId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weatherData = data['data']['forecast']['area'][0];
      return Weather(
        temperature: weatherData['parameter'][5]['timerange'][0]['value'][0]
            ['text'],
        humidity: weatherData['parameter'][0]['timerange'][0]['value'][0]
            ['text'],
        weatherCondition: getWeatherCondition(
            weatherData['parameter'][8]['timerange'][0]['value'][0]['text']),
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  String getWeatherCondition(String index) {
    switch (index) {
      case '0':
        return 'Cerah';
      case '1':
      case '2':
        return 'Cerah Berawan';
      case '3':
        return 'Berawan';
      case '4':
        return 'Berawan Tebal';
      case '5':
        return 'Langit Kabur';
      case '10':
        return 'Berasap';
      case '45':
        return 'Berkabut';
      case '60':
        return 'Hujan Ringan';
      case '61':
        return 'Hujan Sedang';
      case '63':
        return 'Hujan Lebat';
      case '80':
        return 'Hujan Lokal';
      case '95':
      case '97':
        return 'Hujan Petir';
      default:
        return 'Unknown';
    }
  }

  String generateMotivationalMessage(String weatherCondition) {
    if (weatherCondition == 'Cerah' ||
        weatherCondition == 'Cerah Berawan' ||
        weatherCondition == 'Berawan' ||
        weatherCondition == 'Berawan Tebal') {
      return "Hari ini cuacanya sedang $weatherCondition, cocok untuk berolahraga dan beraktifitas di luar ruangan!";
    } else {
      return "Hari ini cuacanya sedang $weatherCondition, sebaiknya hindari aktifitas-aktifitas luar ruangan!";
    }
  }
}

class Weather {
  final String temperature;
  final String humidity;
  final String weatherCondition;

  Weather({
    required this.temperature,
    required this.humidity,
    required this.weatherCondition,
  });
}
