

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:codinglab/pages/navigation.dart';
import 'package:codinglab/main.dart';

import 'package:codinglab/placeCard.dart';


class CardPay extends StatefulWidget {
  var data;
  var time;
  var total;
  var hotelName;

  CardPay(String total, String time, String data, String hotelName){
    this.total = total;
    this.time = time;
    this.data = data;
    this.hotelName = hotelName;
  }
  @override
  State<StatefulWidget> createState() {
    return CardPayState(total,time, data, hotelName);
  }
}

class CardPayState extends State<CardPay> {

  var data;
  var time;
  var total;
  var hotelName;

  CardPayState(String total, String time, String data, String hotelName){
    this.total = total;
    this.time = time;
    this.data = data;
    this.hotelName = hotelName;
  }


  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    final _auth = FirebaseAuth.instance;



    writeHistory(String total, String time, String data, String hotelName) async {

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      // adding history to db
      await firebaseFirestore
          .collection("history")
          .doc(user!.uid)
          .update({"history": FieldValue.arrayUnion([
        {"date" : data,
          "time" : time,
          "table": total,
          "nameofplace": hotelName,
        }
      ])});

      // dynamic index = await  firebaseFirestore
      //     .collection("history")
      //     .doc(user?.uid).get().then((s) => s.data()!['history'][1]['time'][1]);


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
          Navigation(0)));


      print( "Posted HISTORY ");


    }

    Color textcol = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),

      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardBgColor: Color.fromRGBO(0, 62, 41, 1),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true, onCreditCardWidgetChange: (CreditCardBrand ) {  },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      formKey: formKey,
                      onCreditCardModelChange: onCreditCardModelChange,
                      obscureCvv: true,
                      obscureNumber: true,
                      textColor: textcol,
                      cardNumberDecoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',labelStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 18.0, color: textcol,),
                        hintText: 'XXXX XXXX XXXX XXXX', hintStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15.0, color: textcol,),
                      ),
                      expiryDateDecoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',labelStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 18.0, color: textcol,),
                        hintText: 'XX/XX',hintStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15.0, color: textcol,),

                      ),
                      cvvCodeDecoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',labelStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 18.0, color: textcol,),
                        hintText: 'XXX',hintStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15.0, color: textcol,),
                      ),
                      cardHolderDecoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name', labelStyle: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 18.0, color: textcol,),
                      ), expiryDate: '', themeColor: Colors.green, cardNumber: '', cardHolderName: '', cvvCode: '',
                    ),
                    SizedBox(height: height*0.03,),
                    Container(
                      width: MediaQuery. of(context). size. width *0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 62, 41, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),

                          ),),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(110, 13, 110, 13),
                          child: Text('Pay', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1),),),
                        ),
                        onPressed: () {
                          writeHistory(total, time, data, hotelName);
                          //print(name); // reads from placeCard.dart
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

}



class Location{ //modal class for Person object
  String date, time, table;
  Location({required this.date, required this.time, required this.table, });
}





