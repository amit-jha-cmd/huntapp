import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunt/ui/common/functions/saveCurrentLogin.dart';
import 'package:hunt/ui/common/functions/showDialogSingleButton.dart';
import 'dart:convert';

import 'package:hunt/ui/model/json/loginModel.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = "http://192.168.42.105:5000/login";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  var vody = jsonEncode(body);

  final response = await http.post(
    url,
    body: vody,
    headers: { "Accept": "application/json", "content-type": "application/json" }
  );

  // print(response.body);


  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

