import 'dart:convert';

//import 'package:api_imtegration_demo/model/factResponse.dart';
//import 'package:api_task/models/factResponse.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_bootcamp/model/factResponse.dart';


class DataServices{
  Future<factResponse>getData(String location)async{
    http.Response response;
    response=await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=${location}&appid=ddb4bacf08fc5bc3914c02bc48ef7eb4"));
    if(response.statusCode==200){
      print(response.statusCode);
      factResponse fResponse=factResponse.fromJson(json.decode(response.body));
      print(fResponse);
      return fResponse;



    }
    else{
      throw Exception(['Invalid Status Code']);

    }
  }
}