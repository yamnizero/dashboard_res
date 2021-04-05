import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
SharedPreferences prefs;
const Color primeryColor = Color(0xffFF0000);
const String token = "mfflmklbvb1g54gb1s56gb1s65g16s5gb16s5b16s5g1b8s9gbv";
// ignore: non_constant_identifier_names
final String path_api = "http://172.20.10.5/flutterrestaruant/api/";
// ignore: non_constant_identifier_names
final String path_images = "http://172.20.10.5/flutterrestaruant/images/";

String G_use_id_val = "";

final String G_use_id = "use_id";
final String G_use_name= "use_name";
final String G_use_mobile = "use_mobile";
final String G_use_image = "use_image";


Future<bool> checkConnection()
async{

 try
 {
  final result = await InternetAddress.lookup("google.com");
  if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
  {
   print("connect");
   return true;
  }
  else {
   print("not connect");
   return false;
  }
 } on SocketException catch(_){
   print("not connect");
   return false;
 }
}
