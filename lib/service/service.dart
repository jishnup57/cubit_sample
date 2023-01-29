import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceManger {
  static Future<List<dynamic>> makeApiCall(
      String url, Map<String, dynamic> body, HttpMethod method) async {
    late http.Response response;
    final parsedUrl = Uri.parse(url);
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token'
    };
    try {
      switch (method) {
      case HttpMethod.GET:
        response = await http.get(
          parsedUrl,
          headers: headers,
        );
        break;
      case HttpMethod.POST:
        response = await http.post(
          parsedUrl,
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      default:
         response = await http.post(
          parsedUrl,
          headers: headers,
          body: jsonEncode(body),
        );
    }
    log(response.body.toString());
    if (response.statusCode >=200 && response.statusCode <=299) {
      return[response, null];
    }
    return [null, response];
    } catch (e) {
      return [null, e];
    }
    } 

    static Future<void> saveToSharePref(String accessToken)async{
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken);
    }
      static Future<String> getToken()async{
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('accessToken')??'';
    }
  }


enum HttpMethod { GET, POST, PUT, DELETE }
