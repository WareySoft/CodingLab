import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/pages/navigation.dart';



// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       primarySwatch:  Colors.green,
//     ),
//     home: History(),
//   ));
// }


class History extends StatefulWidget{
  var length;
  var array;
  History(int length, List<Location> array){
    this.length = length;
    this.array = array;
  }

  @override
  State<History> createState() => _HistoryState(length, array);


}

class _HistoryState extends State<History> {
  var length;
  var array;
  _HistoryState(int length, List<Location> array){
    this.length = length;
    this.array = array;
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.06, vertical: height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i=length-1; i>= 0; i--)
                historyBuilder(context,array,i),


            ],
          ),

        ),
      ),
      bottomNavigationBar:  SizedBox(
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: IconButton( icon: Icon(Icons.home_filled), onPressed: () {Navigator.pushReplacementNamed(context, "/navigation");},),
                            ),
                          ),label: 'Home'
                      ),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: IconButton( icon: Icon(Icons.bookmark), onPressed: () {Navigator.pushReplacementNamed(context, "/navigation");},),
                          ),label: 'Favourite'
                      ),BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: IconButton( icon: Icon(Icons.history), onPressed: () {},),
                          ),label: 'History'
                      ),
                    ],
                    unselectedItemColor: Colors.white38,
                    selectedItemColor: Colors.white,

                  ),
                ),
              )
          ),
        ),
    );


  }
}


Column historyBuilder(BuildContext context, List<Location> array, int index){
  double width = MediaQuery. of(context). size. width;
  double height = MediaQuery. of(context). size. height;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: width*0.95,
        height: height*0.34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/favorites1.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rich Table',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text('₸₸ - Chinese - American - Deshi food', style: TextStyle(color: Colors.white)),
            Row(
              children: [
                Text('4.3 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 20.0,
                ),
                Text(' 200+Ratings  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.watch_later,
                  color: Colors.black45,
                  size: 20.0,
                ),
                Text(' 3 days ago  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: height*0.01 ,
      ),
      Text('NameOfPlace',style: TextStyle(color: Colors.black, fontSize: height*0.03)),
      Divider(color: Colors.black54,thickness:0.65,),

      Text('Date: ${array[index].date}',style: TextStyle(color: Colors.black, fontSize: height*0.025)),
      Text('Time: ${array[index].time}',style: TextStyle(color: Colors.black, fontSize: height*0.025)),
      Text('Tables: ${array[index].table}',style: TextStyle(color: Colors.black, fontSize: height*0.025)),

      Divider(color: Colors.black54,thickness:0.65,),
      SizedBox(
        height: height*0.03 ,
      ),

    ],
  );
}


