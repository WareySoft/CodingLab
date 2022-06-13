// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:ui';
// import 'package:flutter/material.dart';
//
//
//
// class Category {
//   String? date;
//   String? nameofplace;
//   Color? table;
//   String? time;
//
//   Category(
//       {
//         this.date,
//         this.nameofplace,
//         this.table,
//         this.time,
//       }
//       );
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//
//     return Category(
//       date: json['date'],
//       nameofplace: json['nameofplace'],
//       table: json['table'],
//       time: json['time'],
//     );
//   }
// }
//
//
// class CategoryService {
//
//
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }
//
//   List<Map<String, dynamic>> getCategories() {
//     return _categories;
//   }
//
//   Future<void> getCategoriesCollectionFromFirebase() async {
//     CollectionReference categories = _instance!.collection('history');
//
//     DocumentSnapshot snapshot = await categories.doc(_auth?.currentUser?.uid).get();
//     if (snapshot.exists) {
//       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//       var categoriesData = data['history'] as List<dynamic>;
//       categoriesData.forEach((catData) {
//         Map<String, dynamic> cat = Category.fromJson(catData) as Map<String, dynamic>;
//         _categories.add(cat);
//       });
//     }
//   }
//
// }
//
//
//
