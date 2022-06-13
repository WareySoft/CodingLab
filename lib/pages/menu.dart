import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:codinglab/pages/reserve.dart';
import 'package:codinglab/main.dart';


class CarouselExample extends StatefulWidget {
  var hotelName;
  CarouselExample(String hotelName){
    this.hotelName = hotelName;
  }

  @override
  _CarouselExampleState createState() => _CarouselExampleState(hotelName);
}

class _CarouselExampleState extends State<CarouselExample> {
  final List<String> images = [
    'assets/images/menu_top_1.jpeg',
    'assets/images/menu_top_2.jpeg',
    'assets/images/menu_top_3.jpeg',
    'assets/images/menu_top_4.jpeg',
    'assets/images/menu_top_5.jpeg',
    'assets/images/menu_top_6.jpeg',
  ];

  var hotelName;
  _CarouselExampleState(hotelName){
    this.hotelName = hotelName;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    Color textcol = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
    Color textcol1 = MyApp.themeNotifier.value == ThemeMode.light ? Color.fromRGBO(0, 62, 41, 1) : Colors.white60;


    final _auth = FirebaseAuth.instance;
    int pressed = 0;


    writeFavorite() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      // adding history to db
      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .update({"favorites": FieldValue.arrayUnion([hotelName])});
      pressed = 1;
    }

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 280.0,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Carousel(
                    dotSpacing: 15.0,
                    dotSize: 4.0,
                    dotIncreasedColor: Color.fromRGBO(0, 62, 41, 1),
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 10.0,
                    dotPosition: DotPosition.bottomRight,

                    images: images
                        .map((item) => Container(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(width*0.033),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Center(
                      child: Text('Menu', style: TextStyle(fontSize: 24, fontFamily: 'Poppins-Medium', color: textcol),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Most Populars', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', color: textcol),),
                        IconButton(
                          onPressed: () {
                            writeFavorite();
                            if(pressed == 0){
                              final snackBar = SnackBar(
                                content: Container(
                                  child: Text(
                                    'Added to Favorites',
                                    style: TextStyle(fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: Color.fromRGBO(0, 62, 41, 1),
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.symmetric(vertical: 270, horizontal: 60),
                                behavior: SnackBarBehavior.floating,
                                elevation: 0,

                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          icon: Icon(Icons.add),
                          iconSize: 45,
                          color: textcol,
                        ) ,
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //1111111111111111111111111111111111111111111111111111111111111111111111111111111111
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_1.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Cookie Sandwich', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.grey, thickness:0.65,),
                    const SizedBox(
                      height: 20,
                    ),

                    //222222222222222222222222222222222222222222222222222222222222222222222
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_2.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Combo Burger', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.grey,thickness:0.65,),
                    const SizedBox(
                      height: 20,
                    ),

                    //3333333333333333333333333333333333333333333333333333333333333333333333333333
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_3.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Combo Sandwich', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text('Sea Foods', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', color: textcol),),
                    const SizedBox(
                      height: 20,
                    ),

                    //444444444444444444444444444444444444444444444444444444444444444444444444444444444
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_4.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Oyster dish', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.grey,thickness:0.65,),
                    const SizedBox(
                      height: 20,
                    ),

                    //5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_5.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Oyster on ice', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.grey,thickness:0.65,),
                    const SizedBox(
                      height: 20,
                    ),

                    //66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/menu_6.jpeg', width: 110.0, height: 110.0,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Shrimp Bowl', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: textcol)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: textcol1))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Divider(color: Colors.grey,thickness:0.65,),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],),
        ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromRGBO(0, 62, 41, 1),
        foregroundColor: Colors.white,
        label: Text('  RESERVE  ', ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reserve(hotelName)));
        },

      )
    );
  }
}