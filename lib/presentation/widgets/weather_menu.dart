import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/settings_screen.dart';

import '../screens/search_screen.dart';

class WeatherMenu extends StatelessWidget {
  final Function getWeather;

  const WeatherMenu({Key? key, required this.getWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          const SizedBox(width: 100),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 200,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.deepPurple,
                    Colors.deepPurple,
                    Colors.deepPurple,
                    Colors.black,
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    final city = await Navigator.of(context)
                        .pushNamed(SearchScreen.routeName);
                    if (city != null) {
                      getWeather(city as String);
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
