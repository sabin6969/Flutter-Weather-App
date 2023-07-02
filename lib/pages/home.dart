// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController searchedData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxheight = MediaQuery.of(context).size.height;
    double maxwidth = MediaQuery.of(context).size.width;
    dynamic info = ModalRoute.of(context)?.settings.arguments;

    var temperatureToBeDisplayed = info["temperature_value_passed"];
    var windSpeedToBeDisplayed =
        (info["wind_speed_passed"].toString()).substring(0, 3);
    var humidToBeDisplayed = info["humid_value_passed"];
    var mainValueToBeDisplayed = info["main_value_passed"];
    var city_name = info["city"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: maxheight,
          width: maxwidth,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(width: 1, color: Colors.black)
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/loading",
                            arguments: {"searchedCity": searchedData.text});
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      controller: searchedData,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search City",
                          hintStyle:
                              TextStyle(fontSize: 21, color: Colors.black)),
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 120,
                width: maxwidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 176, 202, 223),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 40,
                          ),
                          Text(
                            "$city_name",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$mainValueToBeDisplayed",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: maxwidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                    color: const Color.fromARGB(255, 157, 149, 126)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      WeatherIcons.thermometer,
                      size: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$temperatureToBeDisplayed",
                          style: TextStyle(fontSize: 50),
                        ),
                        Text(
                          "°C",
                          style: TextStyle(fontSize: 28),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 200,
                      width: maxwidth / 3,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 177, 171),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            WeatherIcons.cloudy_windy,
                            size: 50,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "$windSpeedToBeDisplayed",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "Km/hr",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 200,
                      width: maxwidth / 3,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 62, 110, 222),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            WeatherIcons.humidity,
                            size: 50,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "$humidToBeDisplayed %",
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "Made By Sabin",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                "Data Provided by Openweathermap.org",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
