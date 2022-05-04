
import 'dart:ffi';
import 'package:codinglab/pages/cardpay.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(
//       primarySwatch:  Colors.green,
//     ),
//     debugShowCheckedModeBanner: false,
//
//     home: Reserve(),
//   ));
// }

class Reserve extends StatefulWidget {
  const Reserve({Key? key}) : super(key: key);

  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {


  TimeOfDay time = TimeOfDay(hour: (10), minute: 30);
  DateTime date = DateTime(2022, 09, 25);


  bool x = false;
  bool y = false;
  bool z = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;

    var table_w = width * 0.2;
    var table_h = height * 0.33;
    var bigTable_h  = table_h + height*0.25;


    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Book table", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),),
        centerTitle: true,
      ),


      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: height*0.05-20, right: width*0.28,
              child: Text('Time',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: 23, ),
              ),),
            Positioned(
              top: height*0.05-20, left: width*0.07,
              child: Text('Date',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: 23,  ),
              ),),

            Positioned(
              top: table_h-105, left: width*0.07,
              child: Text('Choose table',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium',fontSize: 23,  ),
              ),),
            Positioned(
              top: table_h-70, left: width*0.07, right: width*0.07,
              child: const Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
              ),),



            Positioned(
              top: height*0.05+10, right: width*0.06, left: width*0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width*0.45,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? newDate =  await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if(newDate == null) return;

                        setState(() {
                          date = newDate;
                        });
                      },
                      style: TextStyle(fontSize: 19, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),

                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today,color: Colors.grey,),
                        hintText: "${date.day}-${date.month}-${date.year}",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 10, ),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),

                        fillColor: Color.fromRGBO(221, 242, 235, 1),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      ),

                    ),
                  ),
                  SizedBox(
                    width: width*0.35,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? newTime =  await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        if(newTime == null) return;

                        setState(() {
                          time = newTime;
                        });
                      },
                      style: TextStyle(fontSize: 19, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),

                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.access_time,color: Colors.grey,),
                        hintText: "${hours}:${minutes}",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 10, ),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),

                        fillColor: Color.fromRGBO(221, 242, 235, 1),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      ),

                    ),
                  ),
                ],
              ),


            ),




            Positioned(
                left: table_w,top: table_h,

                child: InkWell(
                  onTap: (){
                    setState(() {
                      x = !x;
                    });
                  },
                  child: Container(
                    child: Center(child: Text('1', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Poppins-Medium',),)),
                    width: 55,
                    height: 55,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: x ? Color.fromRGBO(0, 62, 41, 1)  : Color.fromRGBO(0, 62, 41, 0.6) ,
                    ),
                  ),
                )
            ),
            Positioned(
                right: table_w,top: table_h,

                child: InkWell(
                  onTap: (){
                    setState(() {
                      y = !y;
                    });
                  },
                  child: Container(
                    child: Center(child: Text('2', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Poppins-Medium',),)),
                    width: 55,
                    height: 55,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: y ? Color.fromRGBO(0, 62, 41, 1) : Color.fromRGBO(0, 62, 41, 0.6) ,
                    ),
                  ),
                )
            ),
            Positioned(
                left: table_w,top: bigTable_h , right: table_w,

                child: InkWell(
                  onTap: (){
                    setState(() {
                      z = !z;
                    });
                  },
                  child: Container(
                    child: Center(child: Text('3', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Poppins-Medium',),)),
                    width: 240,
                    height: 55,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: z ? Color.fromRGBO(0, 62, 41, 1) : Color.fromRGBO(0, 62, 41, 0.6) ,
                    ),
                  ),
                )
            ),


            chairBuilder(table_w +10,table_h - 40,x,"left"),
            chairBuilder(table_w -40,table_h+10,x,"left"),
            chairBuilder(table_w +60,table_h+10,x,"left"),
            chairBuilder(table_w +10,table_h+60,x,"left"),

            chairBuilder(table_w +10,table_h - 40,y,"right"),
            chairBuilder(table_w -40,table_h+10,y,"right"),
            chairBuilder(table_w +60,table_h+10,y,"right"),
            chairBuilder(table_w +10,table_h+60,y,"right"),


            chairBuilder(table_w +10,bigTable_h - 40,z,"left"),
            chairBuilder(table_w +10,bigTable_h - 40,z,"right"),
            chairBuilder(table_w +10,bigTable_h + 60,z,"left"),
            chairBuilder(table_w +10,bigTable_h + 60,z,"right"),
            chairBuilder(table_w -40,bigTable_h + 10,z,"left"),
            chairBuilder(table_w -40,bigTable_h + 10,z,"right"),
            chairBuilder(table_w +70,bigTable_h - 40,z,"left"),
            chairBuilder(table_w +70,bigTable_h - 40,z,"right"),
            chairBuilder(table_w +70,bigTable_h + 60,z,"left"),
            chairBuilder(table_w +70,bigTable_h + 60,z,"right"),

            Positioned(
              bottom: 20, right: table_w -50 , left: table_w -50,

              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 62, 41, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(110, 13, 110, 13),
                  child: Text('Reserve', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1),),),
                ),
                onPressed: () {
                  String total = "";
                  if(x){
                    print("Table 1 reserved");
                    total += "1,";
                  }
                  if(y){
                    print("Table 2 reserved");
                    total += "2,";
                  }
                  if(z){
                    print("Table 3 reserved");
                    total += "3";
                  }
                  String data = "${date.day}/${date.month}/${date.year}";
                  String time = "${hours}:${minutes}";

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      CardPay(total, time, data)));
                },

              ),
            )
          ],
        ),
      ),
    );


  }
}


Positioned chairBuilder(var l, var t, bool q, String pos){
  if( pos == "left"){
    return Positioned(
      left: l,top: t,

      child: Container(
        width: 35,
        height: 35,
        decoration: new BoxDecoration(
            border: Border.all(color: Color.fromRGBO(0, 62, 41, 0.6) ,),
            borderRadius: new BorderRadius.circular(8.0),
            color: q ? Color.fromRGBO(102, 186, 158, 1) : Color.fromRGBO(221, 242, 235, 1)
        ),
      ),
    );
  }
  else{
    return Positioned(
      right: l,top: t,

      child: Container(
        width: 35,
        height: 35,
        decoration: new BoxDecoration(
          border: Border.all(color: Color.fromRGBO(0, 62, 41, 0.6) ,),
          borderRadius: new BorderRadius.circular(8.0),
          color: q ? Color.fromRGBO(102, 186, 158, 1) : Color.fromRGBO(221, 242, 235, 1),

        ),
      ),
    );
  }


}






