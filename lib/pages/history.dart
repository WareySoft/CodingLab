import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void setState(Null Function() param0) {
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.green),
      home: Scaffold(
          backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
            title: Row(
              children: [
                Padding(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.only(top:10),
                ),

                Padding(
                  child: Text("History", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 18),),
                  padding: EdgeInsets.only(top:10,left:100),
                ),

              ],
            ),
          ),



        body:SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/img/BG.png'),
              Text('Rich Table',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text('₸₸   Chinese   American   Deshi food', style: TextStyle(color: Colors.black45)),
              Row(
                children: [
                  Text('4.3 ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 20.0,
                  ),
                  Text(' 200+Ratings  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.watch_later,
                    color: Colors.black45,
                    size: 20.0,
                  ),
                  Text(' 3 days ago  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15),Divider(color: Colors.black54,thickness:0.65,),SizedBox(height: 15),
              Image.asset('assets/img/2.png'),
              Text('Rich Table',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text('₸₸   Chinese   American   Deshi food', style: TextStyle(color: Colors.black45)),
              Row(
                children: [
                  Text('4.3 ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 20.0,
                  ),
                  Text(' 200+Ratings  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.watch_later,
                    color: Colors.black45,
                    size: 20.0,
                  ),
                  Text(' 3 days ago  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15),Divider(color: Colors.black54,thickness:0.65,),SizedBox(height: 15),
              Image.asset('assets/img/3.png'),
              Text('Rich Table',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text('₸₸   Chinese   American   Deshi food', style: TextStyle(color: Colors.black45)),
              Row(
                children: [
                  Text('4.3 ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 20.0,
                  ),
                  Text(' 200+Ratings  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.watch_later,
                    color: Colors.black45,
                    size: 20.0,
                  ),
                  Text(' 3 days ago  ', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15),Divider(color: Colors.black54,thickness:0.65,),SizedBox(height: 15),

            ],
          ),
        ),
        ),
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
                  child: BottomNavigationBar(
                    iconSize: 26,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed, // Fixed
                    backgroundColor: Color.fromRGBO(0, 62, 41, 1),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: Icon(Icons.home_filled),
                          ),label: 'Home'
                      ),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: Icon(Icons.bookmark),
                          ),label: 'Favourite'
                      ),BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
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
      ),
      );

  }
  
}
