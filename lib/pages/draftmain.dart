import 'package:flutter/material.dart';

import 'package:codinglab/pages/login.dart';
import 'package:codinglab/pages/signup.dart';
import 'package:codinglab/pages/welcome.dart';
import 'package:codinglab/pages/home.dart';
import 'package:codinglab/pages/searchpage.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch:  Colors.green,
    ),
    initialRoute: "/",
    routes: {
      "/": (context) => Welcome(),
      "/login": (context) => Login(),
      "/signup": (context) => Signup(),
      "/home": (context) => Home(),
      "/searchpage": (context) => Signup(),
    },

    debugShowCheckedModeBanner: false,

  ));
}