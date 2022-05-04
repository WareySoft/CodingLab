import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/pages/home.dart';
import 'package:codinglab/pages/favorites.dart';
import 'package:codinglab/pages/history.dart';
import 'package:codinglab/pages/profile.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch:  Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: Navigation(),
  ));
}


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  final _auth = FirebaseAuth.instance;

  showHistory() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;


    int  length = await  firebaseFirestore
        .collection("history")
        .doc(user?.uid).get().then((s) => s.data()!['history'].length );

    List<Location> array= [];

    for(int i = 0; i < length; i++ ){
      String x, y, z;
      x = await firebaseFirestore
          .collection("history")
          .doc(user?.uid).get().then((s) => s.data()!['history'][i]['date'].toString());
      y = await firebaseFirestore
          .collection("history")
          .doc(user?.uid).get().then((s) => s.data()!['history'][i]['time'].toString());
      z = await firebaseFirestore
          .collection("history")
          .doc(user?.uid).get().then((s) => s.data()!['history'][i]['table'].toString());

      array.add(Location(date:x, time:y, table:z));
    }


    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
        History(length, array)));
    print( "showHistory ACTIVATED");
  }



  final screens = [
    Home(),
    Favorites(),
  ];

  int _selectedIndex = 0;





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: _selectedIndex < 1 ? Text( "Home", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),) :
        Text(_selectedIndex == 1 ?  "Favorites" : "History", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),),
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
              },

              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Edit Profile'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Dark/Light'),
                  ),
                ];
              },
            ),
          )
        ],
      ),

      body: screens[_selectedIndex],

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
                              child: IconButton( icon: Icon(Icons.history), onPressed: () {showHistory(); },),
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
