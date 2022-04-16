import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(

      primarySwatch: Colors.blueGrey,
    ),
    debugShowCheckedModeBanner: false,
    home: Welcome(),
  ));
}


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: Container(
        alignment: Alignment(0, 1.105),
        child: SizedBox(
          height: 90,
          child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50), topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)
                ),

                boxShadow: [
                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                child: BottomNavigationBar(
                  iconSize: 26,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed, // Fixed
                  backgroundColor: Color.fromRGBO(0, 62, 41, 1),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Icon(Icons.home_filled),
                        ),label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Icon(Icons.bookmark),
                        ),label: 'Favourite'
                    ),BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Icon(Icons.history),
                        ),label: 'History'
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  unselectedItemColor: Colors.white38,
                  selectedItemColor: Colors.white,
                  onTap: _onItemTapped,

                ),
              )
          ),
        ),
      ),

    );
  }
}