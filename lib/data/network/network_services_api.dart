import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_clean_architect/data/exceptions/app_exception.dart';
import 'package:bloc_clean_architect/data/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url) async{
    dynamic jsonResponse;
    try{
      final response=await http.get(Uri.parse(url));
      jsonResponse= returnResponse(response);
    }on SocketException{
      throw NoInternetException('no internet connection');
    }on TimeoutException{
      throw FetchDataException('Time out try again');
    }
   return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async{
  if(kDebugMode){
    print(url);
    print(data);
  }
    dynamic jsonResponse;
    try{
      final response=await http.post(Uri.parse(url),
        body:data
      ).timeout(const Duration(seconds: 50));
      jsonResponse= returnResponse(response);
    }on SocketException{
      throw NoInternetException('no internet connection');
    }on TimeoutException{
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnAuthoriseException('');

      case 500:
       throw FetchDataException('Error Communication');
      default:
        throw UnAuthoriseException();
    }
    }
  }
  
