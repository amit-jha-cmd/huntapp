

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hunt/ui/model/json/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user;
  if ((responseJson != null && !responseJson.isEmpty)) {
    user = LoginModel.fromJson(responseJson).srn;
  } else {
    user = "";
  }
  var token = (responseJson != null && !responseJson.isEmpty) ? LoginModel.fromJson(responseJson).level : "";
  var email = (responseJson != null && !responseJson.isEmpty) ? LoginModel.fromJson(responseJson).name : "";

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastEmail', (email != null && email.length > 0) ? email : "");

}