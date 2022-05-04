import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:codinglab/user_model.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();


}

class _SignupState extends State<Signup> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordWriter = TextEditingController();
  TextEditingController passwordChecker = TextEditingController();


  bool _isHidden1 = true;
  bool _isHidden2 = true;

  void _togglePasswordWriter() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
  void _togglePasswordChecker() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  final _auth = FirebaseAuth.instance;

  postDetailsToFirestore() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    print( "Account created successfully :) ");

    await firebaseFirestore
        .collection("history")
        .doc(user.uid)
        .set({"history" : [], "email" : user.email
    });
    print( "History created successfully :) ");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
          title: Row(
            children: [
              Padding(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.only(top:10),
              ),

              Padding(
                child: Text("Sign up", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),),
                padding: EdgeInsets.only(top:10,left:100),
              ),

            ],
          ),
        ),

        /////////////////////////////////////////////////////////////////////////////////

        body: SingleChildScrollView( child: Center(child: Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
            child: Column(children: [
              SizedBox( // <-- SEE HERE
                width: 600,
                child: TextField(
                  style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),
                  controller: nameController,
                  decoration: InputDecoration(
                    // labelText: 'Email Address'
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( 10, ),
                    ),
                    fillColor: Color.fromRGBO(221, 242, 235, 1),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),

                ),
              ),

              SizedBox(height: 15),

              SizedBox( // <-- SEE HERE
                width: 600,

                child: TextField(
                  style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),
                  obscureText: _isHidden1,
                  controller: passwordWriter,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordWriter,
                      child: Icon( _isHidden1 ? Icons.visibility : Icons.visibility_off ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( 10, ),
                    ),
                    fillColor: Color.fromRGBO(221, 242, 235, 1),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 15),

              SizedBox( // <-- SEE HERE
                width: 600,

                child: TextField(
                  style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),
                  obscureText: _isHidden2,
                  controller: passwordChecker,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffix: InkWell(
                      onTap: _togglePasswordChecker,
                      child: Icon( _isHidden2 ? Icons.visibility : Icons.visibility_off ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( 10, ),
                    ),
                    fillColor: Color.fromRGBO(221, 242, 235, 1),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height:40),

              SizedBox(
                width: 600,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 62, 41, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(110, 13, 110, 13),
                    child: Text('Sign up', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1),),),
                  ),
                  onPressed: () {

                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: nameController.text.trim(), password: passwordWriter.text.trim()
                    )
                        .then((value){
                      print("Created New Account");
                      postDetailsToFirestore();
                      Navigator.pushReplacementNamed(context, "/navigation");
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    } );



                    print(nameController.text);
                    print(passwordWriter.text);
                    print(passwordChecker.text);
                  },

                ),
              ),

              SizedBox(height: 40),
              Row(
                  children: const [
                    Expanded(
                        child: Divider(color: Colors.black54,thickness:0.65,)
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text("OR", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 18),),
                    ),

                    Expanded(
                        child: Divider(color: Colors.black54,thickness:0.65,)
                    ),
                  ]
              ),
              SizedBox(height: 38),
              SizedBox(
                width: 600,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(width: 1, color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 13.5, 7, 13.5),
                      child: Row(children: [
                        Image.asset('assets/google.png', height: 30.0, width: 30.0),
                        SizedBox(width: 50,),
                        Text('Sign in with Google', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 16.5, color: Color.fromRGBO(0,0,0, 1),),),],
                      )
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 600,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(width: 1, color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 13.5, 7, 13.5),
                      child: Row(children: [
                        Image.asset('assets/facebook.png', height: 30.0, width: 30.0),
                        SizedBox(width: 41,),
                        Text('Sign in with Facebook', style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 16.5, color: Color.fromRGBO(0,0,0, 1),),),],
                      )
                  ),
                  onPressed: () {},
                ),
              ),
            ])),
        )));
  }
}