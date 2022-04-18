import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Barista", "address": 'Beibitshilik St 23' , "img" : 'assets/places/barista.jpg'},
    {"id": 2, "name": "Wiskey", "address": 'Qabanbay Batyr Ave', "img" : 'assets/places/wiskey.jpg'},
    {"id": 3, "name": "Becky", "address": 'Haileybury Astana', "img" : 'assets/places/st_regis.jpg'},
    {"id": 4, "name": "Farhi", "address": 'Azerbaijan Mambetov St 3', "img" : 'assets/places/farhi.jpg'},
    {"id": 5, "name": "Hilton", "address": 'Sauran St 46', "img" : 'assets/places/hilton.jpg'},
    {"id": 6, "name": "Riviere", "address": 'Kabanbay Batyr Avenue No:1', "img" : 'assets/places/la_riviere.jpg'},
    {"id": 7, "name": "Mojo", "address": 'Yengbekshiler St 17', "img" : 'assets/places/mojo.jpg'},
    {"id": 8, "name": "Ozen", "address": 'Prospekt Mangilik Yel. 29', "img" : 'assets/places/ozen.jpg'},
    {"id": 9, "name": "Ritz Carlton", "address": 'Dostyk Street 16', "img" : 'assets/places/ritz_carlt.jpg'},
    {"id": 10, "name": "Cloud", "address": 'Sauran St 46', "img" : 'assets/places/cloud9.jpg'},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.only(top:10),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            width: 85,
            child: PopupMenuButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),

              ),
<<<<<<< HEAD
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,10,15,10),
        child: Column(
          children: [
            Text('Find establishment in your city',
              style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: 23, fontWeight: FontWeight.w700 ),
            ),

            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),

              decoration: InputDecoration(

                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
=======
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color(0x55434343),
                child: const TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Search.",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    border: InputBorder.none,
>>>>>>> f62ea21585e5439bc5c32f56deca06b1052bfcd6
                  ),
                ),

                fillColor: Color.fromRGBO(221, 242, 235, 1),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 0.2),
                  child: ListTile(
                    leading:
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,17,10),
                      child: Image.asset('assets/path.png', height: 18, width: 18,),
                    ),

                    // Text(
                    //   _foundUsers[index]["id"].toString(),
                    //   style: const TextStyle(fontSize: 24),
                    // ),

                    title: Text(_foundUsers[index]['name'], style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', ),),
                    subtitle: Text(
                        _foundUsers[index]['address'],
                        style: TextStyle(color: Colors.black54, fontFamily: 'Poppins-Medium',fontSize: 12 ),
                    ),

                  ),
                ),
              )
                  : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: const Text(
                'No results found',
                style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 24),
              ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
