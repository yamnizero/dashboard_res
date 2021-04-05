import 'dart:convert';
import 'package:dashboard_rest/pages/users//users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard_rest/pages/config.dart';
import 'dart:async';
//add database
Future<bool>creatUser
    (String use_name,
    String use_mobile,
    String use_pwd,
    bool use_active,
    String use_note,
    BuildContext context ) async {
  String url =
      path_api + "users/insert_user.php?&token=" +token;
  Map data ={
    "use_name":use_name,
    "use_mobile":use_mobile,
    "use_pwd":use_pwd,
    "use_active":use_active ? "1" : "0",
    "use_note":use_note,
  };
  http.Response response = await http.post(url, body: data);
  if(json.decode(response.body)["code"]=="200") {
    Navigator.push(context,
        MaterialPageRoute(
            builder:(context)=> Users()));
    print("success");
    return true;
  }
  else{
    print("success");
    return false;
  }
}


Future<List> getData(int count ) async{
  String  url = path_api + "users/readuser.php?start=${count}&end=10&token=" +token;
  http.Response response = await http.post(url);
  if(json.decode(response.body)["code"]=="200") {
    {
      List arr =(json.decode(response.body)["message"]);
      return arr;
    }
  }


}