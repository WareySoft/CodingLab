// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:codinglab/test/mmain.dart';
//
//
// class Favorites extends StatefulWidget {
//   const Favorites({Key? key}) : super(key: key);
//
//   @override
//   _FavoritesState createState() => _FavoritesState();
//
//
// }
//
// class _FavoritesState extends State<Favorites> {
//   FirebaseFirestore? _instance = FirebaseFirestore.instance;
//   FirebaseAuth? _auth = FirebaseAuth.instance;
//
//
//   List<dynamic>? pointlist ;
//
//   getdata() async{
//     await _instance?.collection('history').doc(_auth?.currentUser?.uid).get().then((value){
//       setState(() {
//
//         pointlist = List.from(value.data()!['history']);
//       });
//     });
//   }
//   _FavoritesState(){
//     getdata();
//     print("fdddsf");
//   }
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getdata();
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Color textcolt =   MyApp.themeNotifier.value == ThemeMode.light ? Color.fromRGBO(0, 62, 41, 1): Colors.white;
//
//     double width = MediaQuery. of(context). size. width;
//     double height = MediaQuery. of(context). size. height;
//
// try{
//     return Scaffold(
//
//
//
//       body:  SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width*0.033, vertical: height*0.028 ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 for (int i=pointlist!.length-1; i>= 0; i--)
//                   histBuilder(context,pointlist!,i),
//               ],
//             ),
//           ),
//       ),
//
//
//     );}
// catch(e){
//   return Scaffold(
//
//
//
//       body:  Center(
//           child: Text("Loading...", style:TextStyle(fontFamily: 'Poppins-Medium',
//           fontSize: 30, color: textcolt,),),
//         )
//     );
// }
//   }
// }
//
//
//
// Column histBuilder(BuildContext context, List<dynamic> array, int index){
//   Color textcolt =   MyApp.themeNotifier.value == ThemeMode.light ? Color.fromRGBO(0, 62, 41, 1): Colors.white;
//
//   double width = MediaQuery. of(context). size. width;
//   double height = MediaQuery. of(context). size. height;
//
//   Map<String, String> urls = {
//     "Ritz Carlton": 'assets/places/ritz_carlt.jpg',
//     "Farhi": 'assets/places/farhi.jpg',
//     "Hilton": 'assets/places/hilton.jpg',
//     "Riviere": 'assets/places/la_riviere.jpg',
//     "Cloud": 'assets/places/cloud9.jpg',
//     "Barista": 'assets/places/barista.jpg',
//     "Wiskey": 'assets/places/wiskey.jpg',
//     "Mojo": 'assets/places/mojo.jpg',
//     "Ozen": 'assets/places/ozen.jpg',
//     "Becky": 'assets/places/st_regis.jpg',
//   };
//
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         width: width*0.95,
//         height: height*0.34,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(
//               Radius.circular(15.0),
//             ),
//             image: DecorationImage(
//               image: AssetImage("${urls[array[index]['nameofplace']]}"),
//               fit: BoxFit.cover,
//             )
//         ),
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Rich Table',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//             Text('₸₸ - Chinese - American - Deshi food', style: TextStyle(color: Colors.white)),
//             Row(
//               children: [
//                 Text('4.3 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 Icon(
//                   Icons.star,
//                   color: Colors.green,
//                   size: 20.0,
//                 ),
//                 Text(' 200+Ratings  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 Icon(
//                   Icons.watch_later,
//                   color: Colors.black45,
//                   size: 20.0,
//                 ),
//                 Text(' 3 days ago  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         height: height*0.01 ,
//       ),
//       Text(array[index]['nameofplace'],style: TextStyle(color: textcolt, fontSize: height*0.03)),
//       Divider(color: textcolt,thickness:0.65,),
//
//       Text('Date: ${array[index]['date']}',style: TextStyle(color: textcolt, fontSize: height*0.025)),
//       Text('Time: ${array[index]['time']}',style: TextStyle(color: textcolt, fontSize: height*0.025)),
//       Text('Tables: ${array[index]['table']}',style: TextStyle(color: textcolt, fontSize: height*0.025)),
//
//       Divider(color: textcolt,thickness:0.65,),
//       SizedBox(
//         height: height*0.03 ,
//       ),
//
//     ],
//   );
// }
