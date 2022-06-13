


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/methods.dart';
import 'package:codinglab/main.dart';



// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(
//       primarySwatch:  Colors.green,
//     ),
//     home: Favorites(),
//
//     debugShowCheckedModeBanner: false,
//
//   ));
// }


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();


}
class _FavoritesState extends State<Favorites> {
  FirebaseFirestore? _instance = FirebaseFirestore.instance;
  FirebaseAuth? _auth = FirebaseAuth.instance;


  List<String>? favlist ;

  getdata() async{
    await _instance?.collection('users').doc(_auth?.currentUser?.uid).get().then((value){
      setState(() {

        favlist = List.from(value.data()!['favorites']);
      });
    });
  }
  _FavoritesState(){
    getdata();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   getdata();
  // }


  @override
  Widget build(BuildContext context) {
    Color textcolt =   MyApp.themeNotifier.value == ThemeMode.light ? Color.fromRGBO(0, 62, 41, 1): Colors.white;

    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;

    try{
      return Scaffold(



        body:  SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.033, vertical: height*0.028 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowBuilder(context, favlist!),
              ],
            ),
          ),
        ),


      );}
    catch(e){
      return Scaffold(



          body:  Center(
            child: Text("Loading...", style:TextStyle(fontFamily: 'Poppins-Medium',
              fontSize: 30, color: textcolt,),),
          )
      );
    }
  }
}