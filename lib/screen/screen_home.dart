import 'package:flutter/material.dart';
import '../universal/app_bar.dart';
import '../universal/navbar.dart';
import '../styles/styles_home_screen.dart';
import '../function/weather.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<String> provinces = [];
  String? selectedProvince;
  List<String> cities = [];
  String? selectedCity;
  Weather? weather;
  String motivationalMessage = '';

  final WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    fetchProvinces();
  }

  Future<void> fetchProvinces() async {
    try {
      final fetchedProvinces = await weatherService.fetchProvinces();
      setState(() {
        provinces = fetchedProvinces;
      });
    } catch (e) {
      throw Exception('Failed to load provinces');
    }
  }

  Future<void> fetchCities(String provinceId) async {
    try {
      final fetchedCities = await weatherService.fetchCities(provinceId);
      setState(() {
        cities = fetchedCities;
      });
    } catch (e) {
      throw Exception('Failed to load cities');
    }
  }

  Future<void> fetchWeather(String provinceId, String cityId) async {
    try {
      final fetchedWeather = await weatherService.fetchWeather(provinceId, cityId);
      setState(() {
        weather = fetchedWeather;
        motivationalMessage =
            weatherService.generateMotivationalMessage(weather!.weatherCondition);
      });
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); 
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Frame for Weather Forecast
                  Container(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20, bottom: 20),
                    decoration: AppStyles.weatherBoxDecoration,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Cuaca hari ini',
                            style: AppStyles.headline,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(
                              'Pilih Provinsi',
                              style: AppStyles.hintText,
                              textAlign: TextAlign.center,
                            ),
                            value: selectedProvince,
                            onChanged: (String? value) {
                              setState(() {
                                selectedProvince = value;
                                selectedCity = null;
                                cities = [];
                                weather = null;
                              });
                              if (selectedProvince != null) {
                                fetchCities(
                                    selectedProvince!); 
                              }
                            },
                            items: provinces.map((String province) {
                              return DropdownMenuItem<String>(
                                value: province,
                                child: Text(
                                  province,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 50, 50, 50),
                                  ),
                                ),
                              );
                            }).toList(),
                            dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                          SizedBox(height: 20),
                          DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(
                              'Pilih Kota',
                              style: AppStyles.hintText,
                              textAlign: TextAlign.center,
                            ),
                            value: selectedCity,
                            onChanged: (String? value) {
                              setState(() {
                                selectedCity = value;
                                weather = null;
                              });
                              if (selectedProvince != null &&
                                  selectedCity != null) {
                                fetchWeather(selectedProvince!,
                                    selectedCity!); 
                              }
                            },
                            items: cities.map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(
                                  city,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 50, 50, 50),
                                  ),
                                ),
                              );
                            }).toList(),
                            dropdownColor: Color.fromARGB(255, 254, 254, 255),
                          ),
                          SizedBox(height: 20),
                          if (weather != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Suhu:',
                                  style: AppStyles.labelText,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${weather!.temperature}°C',
                                  style: AppStyles.weatherText,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Kelembaban:',
                                  style: AppStyles.labelText,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${weather!.humidity}%',
                                  style: AppStyles.weatherText,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Cuaca:',
                                  style: AppStyles.labelText,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${weather!.weatherCondition}',
                                  style: AppStyles.weatherText,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          else
                            Text(
                              '\n\nPilih provinsi dan kotamu untuk menampilkan perkiraan cuaca',
                              style: AppStyles.labelText_luar,
                              textAlign: TextAlign.center,
                            ),
                          SizedBox(height: 12),
                          // Motivational message
                          Text(
                            motivationalMessage,
                            style: AppStyles.labelText,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 60),

                  Text(
                    'Apa yang Anda butuhkan?',
                    style: AppStyles.headline,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 50), 

                  // Container for feature buttons
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.24),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      children: <Widget>[
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/run_tracker');
                              },
                              style: AppStyles.elevatedButtonStyle,
                              child: Icon(Icons.directions_run,
                                  color: Color.fromARGB(255, 140, 155, 220), size: 45),
                            ),
                            SizedBox(height: 8),
                            Text('Run Tracker',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/calorie_tracker');
                              },
                              style: AppStyles.elevatedButtonStyle,
                              child: Icon(Icons.restaurant,
                                  color: Color.fromARGB(255, 140, 155, 220), size: 45),
                            ),
                            SizedBox(height: 8),
                            Text('Catat Kalori',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/articles');
                              },
                              style: AppStyles.elevatedButtonStyle,
                              child: Icon(Icons.article,
                                  color: Color.fromARGB(255, 140, 155, 220), size: 45),
                            ),
                            SizedBox(height: 8),
                            Text('Artikel Kesehatan',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              style: AppStyles.elevatedButtonStyle,
                              child: Icon(Icons.person,
                                  color: Color.fromARGB(255, 140, 155, 220), size: 45),
                            ),
                            SizedBox(height: 8),
                            Text('Profil dan BMI',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 0),
    );
  }

  @override
  bool get wantKeepAlive => true; 
}
