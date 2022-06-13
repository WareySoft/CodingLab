
import 'package:flutter/material.dart';
import 'package:codinglab/pages/login.dart';
import 'package:codinglab/pages/signup.dart';
import 'package:codinglab/pages/welcome.dart';
import 'package:codinglab/pages/searchpage.dart';
import 'package:codinglab/pages/menu.dart';
import 'package:codinglab/pages/navigation.dart';
import 'package:codinglab/pages/profile.dart';
import 'package:codinglab/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
Map<int, Color> color =
{
  50:Color.fromRGBO(0, 62, 41, 1),
  100:Color.fromRGBO(0, 62, 41, 1),
  200:Color.fromRGBO(0, 62, 41, 1),
  300:Color.fromRGBO(0, 62, 41, 1),
  400:Color.fromRGBO(0, 62, 41, 1),
  500:Color.fromRGBO(0, 62, 41, 1),
  600:Color.fromRGBO(0, 62, 41, 1),
  700:Color.fromRGBO(0, 62, 41, 1),
  800:Color.fromRGBO(0, 62, 41, 1),
  900:Color.fromRGBO(0, 62, 41, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF003E29, color);

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kindacode.com',
            theme: ThemeData(colorScheme: ColorScheme. fromSwatch(primarySwatch: colorCustom),),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            initialRoute: "/",
            routes: {
              "/": (context) => Welcome(),
              "/login": (context) => Login(),
              "/signup": (context) => Signup(),
              "/navigation": (context) => Navigation(0),
              "/searchpage": (context) => SearchPage(),
              "/home": (context) => Home(),
              "/profile" : (context) => ProfileScreen(),
            },
          );
        });
  }
}