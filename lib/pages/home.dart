import 'dart:math';

import 'package:flutter/material.dart';
import 'package:codinglab/placeCard.dart';
import 'package:codinglab/main.dart';
import 'package:codinglab/pages/navigation.dart';


// void main() {
//   runApp(MaterialApp(
//
//     debugShowCheckedModeBanner: false,
//     home: Home(),
//   ));
// }


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab = 0;

  List<String> urls = [
    'assets/places/ritz_carlt.jpg',
    'assets/places/farhi.jpg',
    'assets/places/hilton.jpg',
    'assets/places/la_riviere.jpg',
    'assets/places/cloud9.jpg',
    'assets/places/barista.jpg',
    'assets/places/wiskey.jpg',
    'assets/places/mojo.jpg',
    'assets/places/ozen.jpg',
    'assets/places/st_regis.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    Color textcolt =   MyApp.themeNotifier.value == ThemeMode.light ? Color.fromRGBO(0, 62, 41, 1): Colors.white;

    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;

    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: Container(

        child: Padding(
          padding: const EdgeInsets.only(top:0 , bottom:8.0 , left:0.0 , right:0.0  ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(
                height: height*0.0115,
              ),
              Padding(
                padding: const EdgeInsets.only(top:0 , bottom:8.0 , left:24 , right:24  ),
                child: SizedBox(
                  width: width,
                  child: TextField(
                    readOnly: true,
                    onTap: (){
                      Navigator.pushNamed(context, "/searchpage");
                    },
                    style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),

                    decoration: InputDecoration(

                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular( 10, ),
                        borderSide:  BorderSide(color: Colors.white, width: 1),
                      ),

                      contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    ),

                  ),
                ),
              ),
              SizedBox(height: height*0.01),

              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text('Category', style:TextStyle(fontFamily: 'Poppins-Medium',
                  fontSize: 17.5,fontWeight: FontWeight.bold, color: textcolt,),),
              ),

              SizedBox(height: height*0.008),



              DefaultTabController(
                length: 3,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:0 , bottom:8.0 , left:14 , right:14  ),
                      child: TabBar(
                        isScrollable: true,

                        onTap: (index) {
                          setState(() {
                            _selectedTab = index;
                            print(index);
                          });

                        },
                        indicator: BoxDecoration(),
                        unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1),
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,

                        ),

                        unselectedLabelStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15,),
                        labelColor: Color.fromRGBO(0, 62, 41, 1),
                        labelPadding: EdgeInsets.symmetric(horizontal: 8.0),

                        tabs: [
                          Container(
                            padding: EdgeInsets.all(height*0.003),
                            width: width*0.32,
                            decoration:  BoxDecoration(
                              border: Border.all(color: _selectedTab == 0 ? Color.fromRGBO(0, 62, 41, 1) : Colors.black12),
                              color: Color.fromRGBO(255, 246, 245, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedTab == 0 ? Color.fromRGBO(255, 223, 219, 1) : Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(children: [
                                Padding(
                                  padding:  EdgeInsets.all(height*0.0075),
                                  child: Image.asset('assets/restaurant.png', height: height*0.059, width: width*0.1,),
                                ),
                                Text("Restaurant"),
                              ],) ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(height*0.003),
                            width: width*0.32,
                            decoration:  BoxDecoration(
                              border: Border.all(color: _selectedTab == 1 ? Color.fromRGBO(0, 62, 41, 1): Colors.black12),
                              color: Color.fromRGBO(255, 246, 245, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedTab == 1 ? Color.fromRGBO(255, 223, 219, 1) : Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(children: [
                                Padding(
                                  padding:  EdgeInsets.all(height*0.0075),
                                  child: Image.asset('assets/bar.png', height: height*0.059, width: width*0.12,),
                                ),
                                Text("Bar"),
                              ],) ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(height*0.003),
                            width: width*0.32,
                            decoration:  BoxDecoration(
                              border: Border.all(color: _selectedTab == 2 ? Color.fromRGBO(0, 62, 41, 1): Colors.black12),
                              color: Color.fromRGBO(255, 246, 245, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedTab == 2 ? Color.fromRGBO(255, 223, 219, 1) : Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(children: [
                                Padding(
                                  padding:  EdgeInsets.all(height*0.0075),
                                  child: Image.asset('assets/coffeeshop.png', height: height*0.059, width: width*0.12,),
                                ),
                                Text("Coffee Shop"),
                              ],) ,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height*0.0075,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 200),

                      child: Text('Recomendation', style:TextStyle(fontFamily: 'Poppins-Medium',
                        fontSize: 17.5,fontWeight: FontWeight.bold, color: textcolt),),
                    ),
                     SizedBox(
                      height: height*0.0102,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:0 , bottom:0 , left:14 , right:14  ),
                      child: Container(
                        height: height*0.4,
                        child: TabBarView(
                          children: [
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  placeCard(context, urls[0], "Ritz Carlton", "Dostyk Street 16", 5),
                                  placeCard(context, urls[1], "Farhi", "Mambetov St 3", 4),
                                  placeCard(context, urls[2], "Hilton", "Sauran St 46", 4),
                                  placeCard(context, urls[3], "Riviere", "Kabanbay Batyr Ave", 4),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  placeCard(context, urls[4], "Cloud", "Sauran St 46", 4),
                                  placeCard(context, urls[5], "Barista", "Beibitshilik St 23", 3),
                                  placeCard(context, urls[6], "Wiskey", "Qabanbay Batyr Ave", 5),
                                ],
                              ),
                            ),



                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  placeCard(context, urls[7], "Mojo", "Yengbekshiler St 17", 5),
                                  placeCard(context, urls[8], "Ozen", "Prospekt Mangilik Yel", 5),
                                  placeCard(context, urls[9], "Becky", "Haileybury Astana", 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),

            ],
          ),
        ),
      ),


    );
  }
}