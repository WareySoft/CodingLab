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
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color(0x55434343),
                child: const TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Search for Hotel, Flight...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),



              DefaultTabController(
                length: 3,

                  child: Column(
                    children: [
                      TabBar(
                        indicator: BoxDecoration(),
                        unselectedLabelColor: Color(0xFF555555),
                        labelColor: Color(0xFFFE8C68),
                        labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        tabs: [
                          Tab(
                            child: Container(
                              height: 300.0,
                              color: Colors.transparent,
                              child: Container(
                                  decoration:  BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                        bottomLeft: const Radius.circular(40.0),
                                        bottomRight: const Radius.circular(40.0),
                                      )
                                  ),
                                  child: Center(
                                    child: Text("Restaurant"),
                                  )
                              ),
                            ),
                          ),
                          Tab(
                            text: "Bar",
                          ),
                          Tab(
                            text: "Coffee Shop",
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 280.0,
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
                    ],
                  ),

              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        transform: Matrix4.translationValues(0, 32, 0),
        child: SizedBox(
          height: 90,
          child: Container(
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
      ),
    );
  }
}