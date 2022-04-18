import 'package:flutter/material.dart';
import 'package:codinglab/placeCard.dart';


void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: VirtualOrder(),
  ));
}

class VirtualOrder extends StatefulWidget {
  @override
  _VirtualOrderState createState() => _VirtualOrderState();
}

class _VirtualOrderState extends State<VirtualOrder> {
  int _selectedIndex = 0;
  int _selectedTab = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<String> urls = [
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
    "https://d3aux7tjp119y2.cloudfront.net/original_images/Tak2-CMSTemplate_IrMZHla.jpg",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              Padding(
                child: Text("Home", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),),
                padding: EdgeInsets.only(top:0,left:82),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            width: 85,
            child: PopupMenuButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),

              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String> (
                    value: '1',
                    child: Text('1'),
                  ),
                  PopupMenuItem<String> (
                    value: '2',
                    child: Text('2'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
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
                child: SizedBox( // <-- SEE HERE
                  width: 600,
                  child: TextField(
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
                                  placeCard(urls[1], "Name of place", "Location", 4),
                                  placeCard(urls[2], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                ],
                              ),
                            ),

                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
                                  placeCard(urls[3], "Name of place", "Location", 4),
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
      bottomNavigationBar: Container(
        transform: Matrix4.translationValues(0, 32, 0),

        child: Container(
            height: 87,
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
                        padding: EdgeInsets.only(bottom: 23.0),
                        child: Icon(Icons.home_filled),
                      ),label: 'Home'
                  ),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 23.0),
                        child: Icon(Icons.bookmark),
                      ),label: 'Favourite'
                  ),BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 23.0),
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
    );
  }
}