import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codinglab/pages/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/main.dart';


Column rowBuilder(BuildContext context,List<dynamic> array){

  int length = array.length;
  double width = MediaQuery. of(context). size. width;

  if(length%2 == 1) {
    int even = length -1;
    return Column(

      children: [
        for(int i = 0; i < length-2; i += 2)
          twoFavBuilder(context, array, i),
        SizedBox(
          width: width*0.03,
        ),
        oneFavBuilder(context, array),

      ],
    );

  }
  return Column(

    children: [
      for(int i = 0; i < length; i += 2)
        twoFavBuilder(context, array, i),
    ],
  );

}


Column oneFavBuilder(BuildContext context, List<dynamic> array){
  Map<String, String> urls = {
    "Ritz Carlton": 'assets/places/ritz_carlt.jpg',
    "Farhi": 'assets/places/farhi.jpg',
    "Hilton": 'assets/places/hilton.jpg',
    "Riviere": 'assets/places/la_riviere.jpg',
    "Cloud": 'assets/places/cloud9.jpg',
    "Barista": 'assets/places/barista.jpg',
    "Wiskey": 'assets/places/wiskey.jpg',
    "Mojo": 'assets/places/mojo.jpg',
    "Ozen": 'assets/places/ozen.jpg',
    "Becky": 'assets/places/st_regis.jpg',
  };
  double width = MediaQuery. of(context). size. width;
  double height = MediaQuery. of(context). size. height;
  Color textcol = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
  Color textcol1 = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black38 : Colors.white60;


  final _auth = FirebaseAuth.instance;

  deleteFavorite() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // adding history to db
    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .update({"favorites": FieldValue.arrayRemove([array[array.length-1]])});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
        Navigation(1)));
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: width*0.9,
        height: height*0.24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            image: DecorationImage(
              image: AssetImage("${urls[array[array.length-1]]}"),
              fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    deleteFavorite();
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                  color: textcol,
                ) ,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white54 ,
                ),
                Text("25min", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.white54,
                    ),
                    Text("Free", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                  ],
                ),

                Container(
                    width: 60,
                    height: 35,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: Color.fromRGBO(34, 164, 93, 1),
                    ),
                    child: Center(child: Text("4.5", style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins-Medium'),))
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: width*0.015,),
      Text("${array[array.length-1]}",
        style: TextStyle(color: textcol, fontFamily: 'Poppins-Medium',fontSize: width*0.047, ),
      ),
      Text('Chinese ● American',
        style: TextStyle(color: textcol1, fontFamily: 'Poppins-Medium',fontSize: width*0.04, ),
      ),
      SizedBox(height: width*0.03,),

    ],

  );
}


Row twoFavBuilder(BuildContext context, List<dynamic> array, int index){
  double width = MediaQuery. of(context). size. width;
  double height = MediaQuery. of(context). size. height;
  Color textcol = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
  Color textcol1 = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black38 : Colors.white60;
  Map<String, String> urls = {
    "Ritz Carlton": 'assets/places/ritz_carlt.jpg',
    "Farhi": 'assets/places/farhi.jpg',
    "Hilton": 'assets/places/hilton.jpg',
    "Riviere": 'assets/places/la_riviere.jpg',
    "Cloud": 'assets/places/cloud9.jpg',
    "Barista": 'assets/places/barista.jpg',
    "Wiskey": 'assets/places/wiskey.jpg',
    "Mojo": 'assets/places/mojo.jpg',
    "Ozen": 'assets/places/ozen.jpg',
    "Becky": 'assets/places/st_regis.jpg',
  };

  final _auth = FirebaseAuth.instance;

  deleteFavorite(String nameofplace) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // adding history to db
    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .update({"favorites": FieldValue.arrayRemove([nameofplace])});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
        Navigation(1)));
  }

  return Row(

    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: width*0.45,
        height: height*0.34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            image: DecorationImage(
              image: AssetImage("${urls[array[index]]}"),
              fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    deleteFavorite(array[index]);
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                  color: textcol,
                ) ,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white54 ,
                ),
                Text("25min", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.white54,
                    ),
                    Text("Free", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                  ],
                ),

                Container(
                    width: 60,
                    height: 35,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: Color.fromRGBO(34, 164, 93, 1),
                    ),
                    child: Center(child: Text("4.5", style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins-Medium'),))
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: width*0.015,),
      Text("${array[index]}",
        style: TextStyle(color: textcol, fontFamily: 'Poppins-Medium',fontSize: width*0.047, ),
      ),
      Text('Chinese ● American',
        style: TextStyle(color: textcol1, fontFamily: 'Poppins-Medium',fontSize: width*0.04, ),
      ),
      SizedBox(height: width*0.03,),

    ],

  ),
      SizedBox(
        width: width*0.03,
      ),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Container(
  width: width*0.45,
  height: height*0.34,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.all(
  Radius.circular(15.0),
  ),
  image: DecorationImage(
  image: AssetImage("${urls[array[index+1]]}"),
  fit: BoxFit.cover,
  )
  ),
  padding: EdgeInsets.all(10.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            deleteFavorite(array[index+1]);
          },
          icon: Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: 36,
          ),
          color: textcol,
        ) ,

      ),
    ),
  Row(
  children: [
  Icon(
  Icons.access_time,
  color: Colors.white54 ,
  ),
  Text("25min", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

  ],
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Row(
  children: [
  Icon(
  Icons.attach_money,
  color: Colors.white54,
  ),
  Text("Free", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

  ],
  ),

  Container(
  width: 60,
  height: 35,

  decoration: BoxDecoration(
  borderRadius: BorderRadius.all(
  Radius.circular(12.0),
  ),
  color: Color.fromRGBO(34, 164, 93, 1),
  ),
  child: Center(child: Text("4.5", style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins-Medium'),))
  ),
  ],
  ),
  ],
  ),
  ),
  SizedBox(height: width*0.015,),
    Text("${array[index+1]}",
  style: TextStyle(color: textcol, fontFamily: 'Poppins-Medium',fontSize: width*0.047, ),
  ),
  Text('Chinese ● American',
  style: TextStyle(color: textcol1, fontFamily: 'Poppins-Medium',fontSize: width*0.04, ),
  ),
  SizedBox(height: width*0.03,),

  ],

  ),

    ],
  );

}