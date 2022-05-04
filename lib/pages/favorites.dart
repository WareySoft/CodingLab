import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codinglab/methods.dart';


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




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;




    return Scaffold(



      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.033, vertical: height*0.028 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              rowBuilder(context),
              rowBuilder(context),
              rowBuilder(context),
              rowBuilder(context),
            ],
          ),
        ),
      ),


    );
  }
}