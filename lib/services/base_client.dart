import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "";

class BaseClient{
  static var client = http.Client();

  static Future<dynamic> get(String api) async{
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
    };

    var response = await client.get(url, headers: headers);
    if( response.statusCode == 200){
      return response.body;
    } else {
      //throw exception
    }
  }
  static Future<dynamic> post(String api, dynamic object) async{
    var payload = json.encode(object);
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
      'Content-Type': 'application/json'
    };

    var response = await client.post(url, headers: headers, body: payload);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    } else {
      //throw exception
    }
  }
  static Future<dynamic> put(String api, dynamic object ) async{
    var payload = json.encode(object);
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
      'Content-Type': 'application/json'
    };

    var response = await client.put(url, headers: headers, body: payload);
    if(response.statusCode == 200){
      return response.body;
    } else {
      //throw exception
    }
  }
  static Future<dynamic> delete(String api) async{
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
    };

    var response = await client.delete(url, headers: headers);
    if( response.statusCode == 200){
      return response.body;
    } else {
      //throw exception
    }
  }
}