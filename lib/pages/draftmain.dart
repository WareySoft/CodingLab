import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:codinglab/pages/login.dart';
import 'package:codinglab/pages/signup.dart';
import 'package:codinglab/pages/welcome.dart';
import 'package:codinglab/pages/searchpage.dart';
import 'package:codinglab/pages/menu.dart';
import 'package:codinglab/pages/navigation.dart';
import 'package:codinglab/pages/profile.dart';
import 'package:codinglab/pages/home.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch:  Colors.green,
    ),
    initialRoute: "/",
    routes: {
      "/": (context) => Welcome(),
      "/login": (context) => Login(),
      "/signup": (context) => Signup(),
      "/navigation": (context) => Navigation(),
      "/searchpage": (context) => SearchPage(),
      "/menu": (context) => Menu(),
      "/home": (context) => Home(),
      "/profile" : (context) => ProfileScreen(),
    },

    debugShowCheckedModeBanner: false,

  ));
}