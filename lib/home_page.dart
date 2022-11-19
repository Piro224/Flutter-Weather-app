// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/rowdata.dart';
import 'package:weather_app/getLocation.dart';
import 'package:weather_app/weatherdata.dart';

  var dayInfo = DateTime.now();
  var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class HomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async{
    // var position = await GetPosition();
    data = await client.getData(51.52, -0.11);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
        return SingleChildScrollView(
          child: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  height: size.height * 0.75,
                  width: size.width,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 75, 61, 90),
                        Color.fromARGB(255, 167, 194, 217),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "${data?.cityName}",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9), fontSize: 35),
                        ),
                        SizedBox(height: 10),
                        Text(
                          dateFormat,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9), fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        // Image.asset("assets/images/sunny.png",
                        //     width: size.width * 0.4),
//                         Image.network('http:${data?.icon}', 
//                         width: size.width * 0.36, 
//                         fit: BoxFit.fitWidth,
//                         scale: 1.0,
//                         ),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/sun.png", 
                          width: size.width * 0.36, 
                          fit: BoxFit.fitWidth,
                          scale: 1.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${data?.condition}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${data?.temp}\u00B0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 75,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            RowData(
                              size: size,
                              text1: '${data?.wind} km/h',
                              image: "assets/images/wind.png",
                              text2: 'Wind',
                            ),
                            RowData(
                              size: size,
                              text1: '${data?.humidity}',
                              image: "assets/images/pressure.png",
                              text2: 'Humidity',
                            ),
                            RowData(
                              size: size,
                              text1: '${data?.wind_dir}',
                              image: "assets/images/wind-direction.png",
                              text2: 'Wind Direction',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:  20),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Gust',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.gust} Kp/h',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 20),
                       Text(
                        'Pressure',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.pressure} hpa',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  ),
                Expanded(
                      child: Column(
                    children: [
                      Text(
                        'UV',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.uv}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 20),
                       Text(
                        'Precipitation',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.precipe} mm',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  ),
                Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.wind} Km/h',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 20),
                       Text(
                        'Last Update',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data?.last_update}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ],
          )),
        );
      }
    )),
    );
  }
}
