import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hunt/ui/common/functions/getToken.dart';
import 'package:hunt/ui/common/functions/saveLogout.dart';
import 'package:hunt/ui/model/json/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "https://www.yoururl.com/logout";

  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}