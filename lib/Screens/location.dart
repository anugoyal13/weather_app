// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:weather_app_bootcamp/Services/new_service.dart';
// import 'package:weather_app_bootcamp/model/factResponse.dart';
//
// class WeatherApp extends StatefulWidget {
//   //const WeatherApp({Key? key}) : super(key: key);
//
//   @override
//   _WeatherAppState createState() => _WeatherAppState();
// }
//
// class _WeatherAppState extends State<WeatherApp> {
//   // Object? info=ModalRoute.of(context).settings.arguments;
//   TextEditingController textlocationController = new TextEditingController();
//
//   DataServices dataServices = DataServices();
//   late factResponse fresponse;
//   // late List<factResponse> dataList =[];
//   late List<Weather> weatherList = [];
//   //var wind;
//   late Wind windspeed;
//   late Main temperature;
//
//   late String desc;
//
//   fetchData() async {
//     setState(() {});
//
//     if (textlocationController.text.isEmpty) {
//       fresponse = await dataServices.getData("London");
//     } else {
//       fresponse = await dataServices.getData(textlocationController.text);
//     }
//
//     // dataList=fresponse.weather
//
//     weatherList = fresponse.weather;
//     print("000000");
//     desc = weatherList[0].description;
//     print(desc);
//     windspeed = fresponse.wind;
//     print(windspeed.speed);
//     temperature = fresponse.main;
//     print(temperature.temp);
//
//     // wind= fresponse.wind.speed;
//     // print(wind.toString());
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchData();
//     super.initState();
//   }
//
//   @override
//   void setState(fn) {
//     // TODO: implement setState
//     super.setState(fn);
//     print("set state called");
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     print("widget distroyed");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: Text("weather"),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         // leading: IconButton(
//         //   onPressed: () {
//         //
//         //   },
//         //   icon: Icon(
//         //     Icons.search,
//         //     size: 30,
//         //     color: Colors.white,
//         //   ),
//         // ),
//         // actions: [
//         //   Container(
//         //     margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
//         //     child: GestureDetector(
//         //       onTap: () => print('Menu Clicked!'),
//         //       child: SvgPicture.asset(
//         //         'assets/menu.svg',
//         //         height: 30,
//         //         width: 30,
//         //         color: Colors.white,
//         //       ),
//         //     ),
//         //   ),
//         // ],
//       ),
//       body: Column(
//         children: [
//           Container(
//               height: 200,
//               width: 150,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextField(
//                       controller: textlocationController,
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontFamily: 'Overpass'),
//                       decoration: InputDecoration(
//                         hintText: "Enter location",
//                         hintStyle: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black.withOpacity(0.5),
//                             fontFamily: 'Overpass'),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       fetchData();
//                     },
//                     child: Icon(Icons.search, size: 18, color: Colors.black),
//                   ),
//                 ],
//               )
//
//
//
//           ),
//           FutureBuilder(
//               future: dataServices.getData(textlocationController.text),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Column(
//                     children: [
//                       Text(
//                         fresponse.name,
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         fresponse.timezone.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         fresponse.visibility.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         weatherList[0].main,
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         weatherList[0].description,
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("temp"+
//                           temperature.temp.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("feelslike"+
//                           fresponse.main.feelsLike.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("Mintemp"+
//                           fresponse.main.tempMin.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("Maxtemp"+
//                           fresponse.main.tempMax.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       //Text(weatherList[0].icon.toString()),
//
//                       Text("wind"+
//                           windspeed.speed.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("clouds"+
//                           fresponse.clouds.all.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text("humidity"+
//                           fresponse.main.humidity.toString(),
//                         style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//
//
//
//                     ],
//                   );
//
//                   //     Container(
//                   //       padding: EdgeInsets.all(20),
//                   //       child: Column(
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           Expanded(
//                   //             child: Column(
//                   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //               crossAxisAlignment: CrossAxisAlignment.start,
//                   //               children: [
//                   //                 Column(
//                   //                 crossAxisAlignment: CrossAxisAlignment.start,
//                   //                 children: [
//                   //                   SizedBox(
//                   //                   height: 150,
//                   //                    ),
//                   //                   Text(
//                   //                       textlocationController.text,
//                   //             style: GoogleFonts.lato(
//                   //             fontSize: 35,
//                   //             fontWeight: FontWeight.bold,
//                   //             color: Colors.white,
//                   //             ),
//                   //           ),
//                   //           SizedBox(
//                   //             height: 5,
//                   //           ),
//                   //           Text(
//                   //             fresponse.dt.toString(),
//                   //             style: GoogleFonts.lato(
//                   //               fontSize: 14,
//                   //               fontWeight: FontWeight.bold,
//                   //               color: Colors.white,
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //       Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           Text(
//                   //             temperature.temp.toString(),
//                   //             style: GoogleFonts.lato(
//                   //               fontSize: 85,
//                   //               fontWeight: FontWeight.w300,
//                   //               color: Colors.white,
//                   //             ),
//                   //           ),
//                   //           Row(
//                   //             children: [
//                   //               Text(weatherList[0].icon),
//                   //               SizedBox(
//                   //                 width: 10,
//                   //               ),
//                   //               Text(
//                   //                 weatherList[0].description,
//                   //                 style: GoogleFonts.lato(
//                   //                   fontSize: 25,
//                   //                   fontWeight: FontWeight.w500,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //               ),
//                   //             ],
//                   //           ),
//                   //         ],
//                   //       ),
//                   //       ],
//                   //     ),
//                   // ),
//                   // Column(
//                   // children: [
//                   // Container(
//                   // margin: EdgeInsets.symmetric(vertical: 40),
//                   // decoration: BoxDecoration(
//                   // border: Border.all(
//                   // color: Colors.white30,
//                   // ),
//                   // ),
//                   // ),
//                   // Padding(
//                   // padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                   // child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // children: [
//                   // Column(
//                   // children: [
//                   // Text(
//                   // 'Wind',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   //
//                   // windspeed.speed.toString()
//                   // ,style: GoogleFonts.lato(
//                   // fontSize: 24,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   // 'km/h',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Stack(
//                   // children: [
//                   // Container(
//                   // height: 5,
//                   // width: 50,
//                   // color: Colors.white38,
//                   // ),
//                   // // Container(
//                   // // height: 5,
//                   // // width: locationList[index].wind/2,
//                   // // color: Colors.greenAccent,
//                   // // ),
//                   // ],
//                   // ),
//                   // ],
//                   // ),
//                   // Column(
//                   // children: [
//                   // Text(
//                   // 'Rain',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   // fresponse.clouds.toString(),
//                   // style: GoogleFonts.lato(
//                   // fontSize: 24,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   // '%',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Stack(
//                   // children: [
//                   // Container(
//                   // height: 5,
//                   // width: 50,
//                   // color: Colors.white38,
//                   // ),
//                   // // Container(
//                   // // height: 5,
//                   // // width: locationList[index].rain/2,
//                   // // color: Colors.redAccent,
//                   // // ),
//                   // ],
//                   // ),
//                   // ],
//                   // ),
//                   // Column(
//                   // children: [
//                   // Text(
//                   // 'Humidy',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   // fresponse.main.humidity.toString(),
//                   // style: GoogleFonts.lato(
//                   // fontSize: 24,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Text(
//                   // '%',
//                   // style: GoogleFonts.lato(
//                   // fontSize: 14,
//                   // fontWeight: FontWeight.bold,
//                   // color: Colors.white,
//                   // ),
//                   // ),
//                   // Stack(
//                   // children: [
//                   // Container(
//                   // height: 5,
//                   // width: 50,
//                   // color: Colors.white38,
//                   // ),
//                   // // Container(
//                   // // height: 5,
//                   // // width: locationList[index].humidity/2,
//                   // // color: Colors.redAccent,
//                   // // ),
//                   // ],
//                   // ),
//                   // ],
//                   // ),
//                   // ],
//                   // ),
//                   // ),
//                   // ],
//                   // ),
//                   // ],
//                   // ),
//                   // );
//                   //   ListView.builder(
//                   //    itemCount: 1,
//                   //     itemBuilder: (context, index) {
//                   //       return Card(
//                   //           elevation: 15,
//                   //           color: Colors.white,
//                   //           shadowColor: Colors.lightBlue,
//                   //           shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(25)),
//                   //
//                   //           child: Row(
//                   //             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //             children: [
//                   //               Column(
//                   //                 children: [
//                   //                   Text(weatherList[0].description,
//                   //                     style: const TextStyle(
//                   //                         fontSize: 20, fontWeight: FontWeight
//                   //                         .bold),),
//                   //
//                   //
//                   //
//                   //             ],
//                   //           )
//                   //       ]
//                   //           )
//                   //       );
//                   //     }
//                   // );
//                 } else
//                   //TextField:"london":textlocationController.text;// if textfield is null then hardcoded else controller value
//
//                     {
//                   return CircularProgressIndicator();
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }
