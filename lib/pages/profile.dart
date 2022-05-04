import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codinglab/pages/navigation.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile',),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 62, 41, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                Navigation()));
          },
          icon: Icon(Icons.home),
        ) ,
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Stack(//Контейнер Stack позволяет располагать одни элементы поверх других.Контейнер Stack позволяет располагать одни элементы поверх других.
            children: [
              Container(
                  height: 140,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 62, 41, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(34),
                        bottomLeft: Radius.circular(34)),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, right: 20, left: 20),// суретке отступ устинен


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
                      height: 10.0,
                    ),
                    Text("Name", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: Colors.black,),),

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
                      height: 10.0,
                    ),
                    Text("Phone Number", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: Colors.black,),),
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
                      height: 10.0,
                    ),
                    Text("Password", style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 15, color: Colors.black,),),
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
                        width: 600,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0, 62, 41, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),

                            ),),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(110, 13, 110, 13),
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
                top: 170,
                left: MediaQuery.of(context).size.width*0.5+20,// иконканы ортага жылжыту ушин
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(0, 62, 41, 1),// конканын орналасуы
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
