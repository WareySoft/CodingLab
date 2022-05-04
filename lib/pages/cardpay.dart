

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:codinglab/pages/navigation.dart';




class CardPay extends StatefulWidget {
  var data;
  var time;
  var total;

  CardPay(String total, String time, String data){
    this.total = total;
    this.time = time;
    this.data = data;
  }
  @override
  State<StatefulWidget> createState() {
    return CardPayState(total,time, data);
  }
}

class CardPayState extends State<CardPay> {

  var data;
  var time;
  var total;

  CardPayState(String total, String time, String data){
    this.total = total;
    this.time = time;
    this.data = data;
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



    writeHistory(String total, String time, String data) async {

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
        }
      ])});

      // dynamic index = await  firebaseFirestore
      //     .collection("history")
      //     .doc(user?.uid).get().then((s) => s.data()!['history'][1]['time'][1]);


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
          Navigation()));


      print( "Posted HISTORY ");


    }

    return  Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
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
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',

                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                      ), expiryDate: '', themeColor: Colors.green, cardNumber: '', cardHolderName: '', cvvCode: '',
                    ),
                    SizedBox(height: 20,),
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
                          writeHistory(total, time, data);
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





