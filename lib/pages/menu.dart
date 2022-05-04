import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
import 'package:codinglab/pages/reserve.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(Menu());
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarouselExample(),
    );
  }
}

class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
        backgroundColor: Colors.white,
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
                    Center(
                      child: Text('Menu', style: TextStyle(fontSize: 24, fontFamily: 'Poppins-Medium', color: Colors.black),),
                    ),

                    Text('Most Populars', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', color: Colors.black),),
                    const SizedBox(
                      height: 20,
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
                          children: const [
                            Text('Cookie Sandwich', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
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
                          children: const [
                            Text('Combo Burger', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
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
                          children: const [
                            Text('Combo Sandwich', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text('Sea Foods', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', color: Colors.black),),
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
                          children: const [
                            Text('Oyster dish', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
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
                          children: const [
                            Text('Oyster on ice', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
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
                          children: const [
                            Text('Shrimp Bowl', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18, color: Colors.black)),
                            Text('Shortbread, chocolate turtle', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('cookies, and red velvet.', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 14, color: Colors.grey)),
                            Text('1400 ₸', style: TextStyle(fontSize: 18, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 62, 41, 1)))
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reserve()));
        },

      )
    );
  }
}