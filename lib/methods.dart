import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Row rowBuilder(BuildContext context){

  double width = MediaQuery. of(context). size. width;
  double height = MediaQuery. of(context). size. height;

  return Row(

    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width*0.45,
            height: height*0.34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/places/st_regis.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white54 ,
                    ),
                    Text("25min", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.white54,
                        ),
                        Text("Free", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                      ],
                    ),

                    Container(
                        width: 60,
                        height: 35,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Color.fromRGBO(34, 164, 93, 1),
                        ),
                        child: Center(child: Text("4.5", style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins-Medium'),))
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: width*0.015,),
          Text('NAMEOFPLACE',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: width*0.047, ),
          ),
          Text('Chinese ● American',
            style: TextStyle(color: Colors.black38, fontFamily: 'Poppins-Medium',fontSize: width*0.04, ),
          ),
          SizedBox(height: width*0.03,),
        ],

      ),
      SizedBox(
        width: width*0.03,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width*0.45,
            height: height*0.34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/places/st_regis.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white54 ,
                    ),
                    Text("25min", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.white54,
                        ),
                        Text("Free", style: TextStyle(color: Colors.white70, fontFamily: 'Poppins-Medium', fontSize: height*0.022),),

                      ],
                    ),

                    Container(
                        width: 60,
                        height: 35,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Color.fromRGBO(34, 164, 93, 1),
                        ),
                        child: Center(child: Text("4.5", style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins-Medium'),))
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: width*0.015,),
          Text('NAMEOFPLACE',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: width*0.047, ),
          ),
          Text('Chinese ● American',
            style: TextStyle(color: Colors.black38, fontFamily: 'Poppins-Medium',fontSize: width*0.04, ),
          ),
          SizedBox(height: width*0.03,),
        ],

      ),
    ],
  );
}