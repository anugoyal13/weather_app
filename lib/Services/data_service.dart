import 'package:http/http.dart';
import 'dart:convert';

class DataServices{
  late String location;
  late String temp;
  late String humidity;
  late String air_speed;
  late String  description;
  late String main;

  DataServices({required this.location}){
    location=this.location;
  }


  Future<void> getData() async{
    try{
      Response response= await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=ddb4bacf08fc5bc3914c02bc48ef7eb4"));
      Map data=jsonDecode(response.body);
      //getting temp, humidity
      Map temp_data=data["main"];
      String getHumidity=temp_data["humidity"].toString();
      double getTemp =temp_data["temp"];

      //getting air
      Map wind=data["wind"];
      String getAir_speed=wind["speed"].toString();

      //getting descriptions
      List weather_data=data["weather"];
      Map weather_main_data=weather_data[0];
      String getMain_desc=weather_main_data["main"];
      String getDesc=weather_main_data["description"];


      //assigning values
      temp=getTemp.toString();
      humidity=getHumidity;
      air_speed=getAir_speed;
      description=getDesc;
      main=getMain_desc;



    }catch(e){
      throw Exception("error");
    }


  }


}