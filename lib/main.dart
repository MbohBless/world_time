import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';
import 'pages/choose_location.dart';
import 'pages/home.dart';

void main() =>runApp(MaterialApp(
  initialRoute: "/",
  routes: {
  "/":(context)=>Loading(),
    "/home":(context)=>Home(),
    "/location":(context)=>ChooseLocation()
  },
));

