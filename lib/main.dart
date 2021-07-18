import 'package:flutter/material.dart';

import 'Screens/weather_app.dart';
import 'Screens/loadingpage.dart';
import 'Screens/location.dart';


void main() {
  runApp(MaterialApp(
      routes: {
    "/": (context)=>loadingPage(),
    //"/home":(context)=> WeatherApp(),
  },
  debugShowCheckedModeBanner: false)



  );

}
// class  myApp extends StatelessWidget {
//   //const ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: loadingPage(),
//     );
//   }
// }




