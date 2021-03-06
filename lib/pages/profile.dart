import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codinglab/pages/navigation.dart';
import 'package:codinglab/main.dart';



// void main()=> runApp(const MaterialApp(
//   home: ProfileScreen(),
// ));


class ProfileScreen extends StatefulWidget {
  const ProfileScreen ({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();


  final _auth = FirebaseAuth.instance;

  postContacts() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;


    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .update({
      'name': userNameController.text,
      'phone': userPhoneController.text,
    });




    FirebaseAuth.instance.currentUser?.updatePassword(userPasswordController.text);
    print( "Posted contacts of user ");


  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    Color textcol = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile',),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 62, 41, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                Navigation(0)));
          },
          icon: Icon(Icons.home),
        ) ,
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Stack(//?????????????????? Stack ?????????????????? ?????????????????????? ???????? ???????????????? ???????????? ????????????.?????????????????? Stack ?????????????????? ?????????????????????? ???????? ???????????????? ???????????? ????????????.
            children: [
              Container(
                  height: height*0.21,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 62, 41, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(34),
                        bottomLeft: Radius.circular(34)),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.115, right: 20, left: 20),// ?????????????? ???????????? ??????????????


                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 3),
                          borderRadius: BorderRadius.circular(60),
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: const Image(
                            image: AssetImage('assets/avatar.png'),
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*0.015,
                    ),
                    Text("Name", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: textcol,),),

                    TextField(
                      controller: userNameController,
                      style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Poppins-Medium', ),
                      decoration: InputDecoration(
                        // labelText: 'Email Address'
                        hintText: 'username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 10, ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),

                    ),
                    SizedBox(
                      height: height*0.015,
                    ),
                    Text("Phone Number", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: textcol,),),
                    TextField(
                      controller: userPhoneController,
                      style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Poppins-Medium', ),
                      decoration: InputDecoration(
                        // labelText: 'Email Address'
                        hintText: 'phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 10, ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),

                    ),

                    SizedBox(
                      height: height*0.015,
                    ),
                    Text("Password", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: textcol,),),
                    TextField(
                      controller: userPasswordController,
                      style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Poppins-Medium', ),
                      decoration: InputDecoration(
                        // labelText: 'Email Address'
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 10, ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),

                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:60.0, right: 15, left: 15),
                      child: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0, 62, 41, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),

                            ),),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(width*0.27, 13, width*0.27, 13),
                            child: Text('Update', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1),),),
                          ),
                          onPressed: () {
                            postContacts();
                          },

                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Positioned(
                top: height*0.25,
                left: MediaQuery.of(context).size.width*0.5+20,// ???????????????? ???????????? ?????????????? ????????
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(0, 62, 41, 1),// ???????????????? ??????????????????
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}
