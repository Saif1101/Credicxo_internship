import 'dart:convert';

import 'package:credixco_intern/data/core/API_constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic,dynamic>? params}) async{


    /*final response = await _client.get(
      getPath(path,params),
      headers: {
        'Content-Type': 'application/json'
      },
    );*/


    final response = await _client.get(
      getPath(path,params),
      // headers: {
      //   'Content-Type': 'application/json'
      // },
    );
    if(response.statusCode==200){
      
      return json.decode(response.body);
  }else{
      
      throw Exception(response.reasonPhrase);
    }
  }

Uri getPath(String path, Map<dynamic,dynamic>? params){
  //chart/ track/ lyric
  // chart.tracks.get
  // track.get
  // track.lyrics.get
    var paramsString = '';
    if(params?.isNotEmpty ?? false){
      params?.forEach((key, value) {
        paramsString += '$key=$value';
      });
    }
    var uri = Uri.parse("${ApiConstants.BASE_URL}$path?$paramsString${paramsString==''?'':'&'}apikey=${ApiConstants.API_KEY}");
   
    return uri; 
  }

}