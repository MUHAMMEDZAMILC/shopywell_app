// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../core/helper/help_toast.dart';
import 'api/urls.dart';
enum Method { get, post, put, delete }
class ApiDio {
  // static const _headers = {'Content-Type': 'application/json'};
static final dio = Dio();
  static Future? call(BuildContext context, {required String endPoint, required Method method, Object? body}) async {
    try {
      Response response;
      log("${baseurl + endPoint} ($method)\n$body");

      //REST API METHOD
      switch (method) {
        case Method.get:
          String url = baseurl + endPoint;
          response = await dio.get(url,);
          log(response.data.toString());

          try {
            final data = response.data;
            return data;
          } catch (err) {
            rethrow;
          }

        case Method.post:
          log( json.encode(body));
          response = await dio.post(baseurl + endPoint, data: body);
          log(response.data.toString());
           var data;
          try {
            if (response.statusCode ==200) {
               data =response.data;
            }else{
              data = {
                "error":true,
                "msg":"Server Down"
              };
            }
            return data;
          } catch (err) {
            rethrow;
          }

        case Method.put:
          response = await dio.put(baseurl + endPoint, data: json.encode(body), );
          log(response.data.toString());
          try {
            final data = response.data;
            return data;
          } catch (err) {
            rethrow;
          }
        default:
          return null;
      }
    } on SocketException {
      
      snackBar(context, message: "Network seems to be offline", type: MessageType.error);
      return null;
    } catch (e) {
     
      snackBar(context, message: e.toString());
      debugPrint("$e");
      return null;
    }
  }
}
