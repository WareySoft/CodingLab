import 'package:flutter/material.dart';



class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 62, 41, 1.0),

        body: Center(child: Column(children: [
          Padding(
            child: Image.asset('assets/logo.png', height: 200, width: 250,fit: BoxFit.fitWidth,),
            padding: EdgeInsets.only(top:100, right: 5),
          ),

          Padding(padding: EdgeInsets.only(top:10),),
          Text("Virtual Order", style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.bold, fontSize: 42),),

          Container(
            margin: const EdgeInsets.fromLTRB(0,100 , 0 , 10 ),
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, "/signup");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                child: Text('Sign up', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(0, 0, 0, 1.0),),),
              ),

            ),
            // // for shadow of container
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(color: Color.fromRGBO(111, 75, 242, 0.8), spreadRadius: 3),
            //   ],
            // ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,20 , 0 , 20 ),
            child: FlatButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, "/login");
              },
              height: 50,
              child: Text('  Log in  ', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, ), ),
              shape: Border(
                  bottom: BorderSide(color: Colors.white70, width: 1)
              ),
              textColor: Colors.white,
            ),
          ),


        ]))
    );
  }
}