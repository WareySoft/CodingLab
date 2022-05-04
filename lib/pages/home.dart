import 'package:flutter/material.dart';
import 'package:codinglab/placeCard.dart';


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

    return Scaffold(
      backgroundColor: Colors.white,

      resizeToAvoidBottomInset: false,

      body: Container(

        child: Padding(
          padding: const EdgeInsets.only(top:0 , bottom:8.0 , left:0.0 , right:0.0  ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(
                height: 7.8,
              ),
              Padding(
                padding: const EdgeInsets.only(top:0 , bottom:8.0 , left:24 , right:24  ),
                child: SizedBox(
                  width: 600,
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

                      fillColor: Color.fromRGBO(221, 242, 235, 1),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 6.5),

              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text('Category', style:TextStyle(fontFamily: 'Poppins-Medium',
                  fontSize: 17.5,fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 62, 41, 1),),),
              ),

              SizedBox(height: 5.0),



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
                            padding: EdgeInsets.all(2),
                            width: 130,
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
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset('assets/restaurant.png', height: 40, width: 40,),
                                ),
                                Text("Restaurant"),
                              ],) ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(2),
                            width: 130,
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
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset('assets/bar.png', height: 50, width: 50,),
                                ),
                                Text("Bar"),
                              ],) ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(2),
                            width: 130,
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
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset('assets/coffeeshop.png', height: 50, width: 50,),
                                ),
                                Text("Coffee Shop"),
                              ],) ,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 200),

                      child: Text('Recomendation', style:TextStyle(fontFamily: 'Poppins-Medium',
                        fontSize: 17.5,fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 62, 41, 1),),),
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:0 , bottom:0 , left:14 , right:14  ),
                      child: Container(
                        height: 265.0,
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