import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_bootcamp/Screens/weather_app.dart';
import 'package:weather_app_bootcamp/Services/data_service.dart';
import 'package:weather_app_bootcamp/model/factResponse.dart';


class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  _loadingPageState createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  TextEditingController textlocationController = new TextEditingController();

  //DataServices dataServices = DataServices();
 // late factResponse fresponse;
  // late List<factResponse> dataList =[];
 // late List<Weather> weatherList = [];
  //var wind;
  //late Wind windspeed;
  //late Main temperature;

 // late String desc;
 // int _currentPage = 0;
  //late String bgImg="assets/images/night.jpg";

  // _onPageChanged(int index) {
  //   setState(() {
  //     _currentPage = index;
  //   });
  // }
  //fetchData() async {
  //  setState(() {});

    // if (textlocationController.text.isEmpty) {
    //   fresponse = await dataServices.getData("London");
    // } else {
    //   fresponse = await dataServices.getData(textlocationController.text);
    // }

    // dataList=fresponse.weather

    // weatherList = fresponse.weather;
    // print("000000");
    // desc = weatherList[0].description;
    // print(desc);
    // windspeed = fresponse.wind;
    // print(windspeed.speed);
    // temperature = fresponse.main;
    // print(temperature.temp);
    // print(weatherList[0].main);

    // wind= fresponse.wind.speed;
    // print(wind.toString());
    //setState(() {});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Text("Go",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => WeatherApp(loc:textlocationController.text)));
          }),

      body: Container(
        child: Stack(
          
          children:[ 
            Container(
              height: double.infinity,
                width: double.infinity,
                child:
            Image.asset("assets/images/weather.jpg",fit: BoxFit.cover,)),
            
            SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text(" Weather ",style:GoogleFonts.cabin(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                    Text(" App ",style:GoogleFonts.cabin(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),),
                  ],
                ),
                SizedBox(height: 250,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 150),
                  child: TextField(
                   // onChanged: ,
                    controller: textlocationController,

                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,fontWeight: FontWeight.bold,
                        fontFamily: 'Overpass'),
                    decoration: InputDecoration(
                      
                      hintText: "Enter location",
                      hintStyle: TextStyle(
                          fontSize: 16,


                          color: Colors.white,
                          fontFamily: 'Overpass'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),borderRadius:  BorderRadius.circular(10))
                      ),
                    ),
                  ),
                ]),
            ),
              // Container(
              //   height: 50,
              //   width: 100,
              //   color: Colors.transparent,
              //   child: MaterialButton(onPressed: (){
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => WeatherApp(loc:textlocationController.text)));
              //
              //   },
              //   child:Text(" Go",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
              //   ),
              //
              // ),


            ],
          ),

        ),
      );


  }
}
