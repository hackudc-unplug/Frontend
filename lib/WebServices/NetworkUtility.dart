import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Response.dart';

class NetworkUtility {
  Future<http.Response> post(
      String url, Map<String, String> body, bool needSession) async {
    print("post");

    http.Response response = await http.post(
      Uri.parse(url),
      headers: getHeaders(needSession),
      body: jsonEncode(body),
    );
    print(response.toString());
    return response;
  }

  Future<http.Response> get(String url, bool needSession) async {
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(needSession),
    );
  }

  Map<String, String> getHeaders(bool needSession) {
    return {"content-type": "application/json"};
  }
}
