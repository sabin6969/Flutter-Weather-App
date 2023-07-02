import 'package:flutter/material.dart';
import 'package:weatherapp/works/working.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var city = "Pokhara";
  String? temp;
  String? windspeed;
  String? humid;
  String? feelslike;
  String? main;
  void getData() async {
    WeatherInfo obj1 = WeatherInfo(cityName: city);
    await obj1.getData();
    temp = obj1.temperature;
    windspeed = obj1.windSpeed;
    humid = obj1.humidity;
    feelslike = obj1.feelsLike;
    main = obj1.main;

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temperature_value_passed": temp,
        "humid_value_passed": humid,
        "feelslike_value_passed": feelslike,
        "main_value_passed": main,
        "wind_speed_passed": windspeed,
        "city": city
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic searchedQuery = ModalRoute.of(context)?.settings.arguments;
    if (searchedQuery?.isNotEmpty ?? false) {
      city = searchedQuery["searchedCity"];
    }
    getData();
    double maxheight = MediaQuery.of(context).size.height;
    double maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Loading Data"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: maxheight / 3,
              width: maxwidth / 2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assests/images/image.png"))),
            ),
            Text(
              "Weather App",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            SpinKitDualRing(
              color: Colors.deepOrangeAccent,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyanAccent,
    );
  }
}
