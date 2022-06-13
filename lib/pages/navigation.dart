import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/pages/home.dart';
import 'package:codinglab/pages/favorites.dart';
import 'package:codinglab/pages/history.dart';
import 'package:codinglab/pages/profile.dart';
import 'package:codinglab/main.dart';


//
// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(
//       primarySwatch:  Colors.green,
//     ),
//     debugShowCheckedModeBanner: false,
//     home: Navigation(),
//   ));
// }

class Navigation extends StatefulWidget {
  int page =0;
  Navigation(int page){
    this.page = page;
  }
  @override
  _NavigationState createState() => _NavigationState(page);
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex =0;
  _NavigationState(int page){
    _selectedIndex = page;
  }




  @override
  Widget build(BuildContext context) {
    Color textcol =   MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
            ? Colors.white
            : Colors.black12 ,

        title: _selectedIndex < 1 ? Text( "Home", style: TextStyle(color: textcol, fontFamily: 'Poppins-Medium', fontSize: 24),) :
        Text(_selectedIndex == 1 ?  "Favorites" : "History", style: TextStyle(color: textcol, fontFamily: 'Poppins-Medium', fontSize: 24),),
        centerTitle: true,
        actions: <Widget>[
          Container(
            width: 85,
            child: PopupMenuButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),

              ),
              onSelected: (result) {
                if (result == 0) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                      ProfileScreen()));
                }
                if (result == 1) {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed( "/");
                }

              },

              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Edit Profile'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Log out'),
                  ),
                ];
              },
            ),
          ),IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              color: (MyApp.themeNotifier.value == ThemeMode.light
                  ? Color.fromRGBO(0, 62, 41, 1)
                  : Colors.white),

              onPressed: () {
                MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
                print(MyApp.themeNotifier.toString());
              })
        ],
      ),

      body: _selectedIndex < 1 ? Home() : ( _selectedIndex == 1 ? Favorites() : History()),

      bottomNavigationBar: Container(
          child: SizedBox(
            height: 56,

            child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40), topLeft: Radius.circular(40),
                  ),

                  boxShadow: [
                    BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),


                  child: SingleChildScrollView(
                    child: BottomNavigationBar(
                      iconSize: 26,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      type: BottomNavigationBarType.fixed, // Fixed
                      backgroundColor: Color.fromRGBO(0, 62, 41, 1),
                      items:  [
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: IconButton( icon: Icon(Icons.home_filled), onPressed: () {setState(() {
                                _selectedIndex = 0;
                              }); },),
                            ),label: 'Home'
                        ),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: IconButton( icon: Icon(Icons.bookmark), onPressed: () {setState(() {
                                _selectedIndex = 1;
                              });},),
                            ),label: 'Favourite'
                        ),BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: IconButton( icon: Icon(Icons.history), onPressed: () {setState(() {
                                _selectedIndex = 2;
                              });},),
                            ),label: 'History'
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      unselectedItemColor: Colors.white38,
                      selectedItemColor: Colors.white,

                    ),
                  ),
                )
            ),
          ),
        ),

    );
  }
}

class Location{ //modal class for Person object
  String date, time, table;
  Location({required this.date, required this.time, required this.table, });
}

class Info{ //modal class for Person object
  int length;
  List<Location> array;
  Info({required this.length, required this.array,  });
}
