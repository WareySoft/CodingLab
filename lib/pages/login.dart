import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();


}

class _LoginState extends State<Login> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;

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
                child: Text("Log in", style: TextStyle(color: Color.fromRGBO(9, 10, 10, 1), fontFamily: 'Poppins-Medium', fontSize: 24),),
                padding: EdgeInsets.only(top:10,left:width*0.244),
              ),

            ],
          ),
        ),

        /////////////////////////////////////////////////////////////////////////////////

        body: SingleChildScrollView( child: Center(child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 50),
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

              SizedBox(height: height*0.022),

              SizedBox( // <-- SEE HERE
                width: 600,

                child: TextField(
                  style: TextStyle(fontSize: 17, color: Color.fromRGBO(28, 36, 57, 1), fontFamily: 'Poppins-Medium', ),
                  obscureText: _isHidden,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon( _isHidden ? Icons.visibility : Icons.visibility_off ),
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
              SizedBox(height: height*0.0074),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.sendPasswordResetEmail(email: nameController.text.trim() );
                    },
                    child: const Text('Forgot Password?', style:TextStyle(fontFamily: 'Poppins-Medium',fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 62, 41, 1),),),
                  ),
                ],
              ),

              SizedBox(height:height*0.037),

              SizedBox(
                width: 600,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 62, 41, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),),
                  child:  Padding(
                    padding: EdgeInsets.fromLTRB(width *0.268, 13, width *0.268, 13),
                    child: Text('Log in', style: TextStyle(fontFamily: 'Poppins-Medium',fontSize: 20.0, color: Color.fromRGBO(255, 255, 255, 1),),),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: nameController.text.trim(), password: passwordController.text.trim()
                    ).then((value) {
                      print("Logged in");
                      Navigator.pushReplacementNamed(context, "/navigation");

                    }).onError((error, stackTrace) {
                      String text = error.toString().replaceAll(RegExp('\\[.*?\\]'), '');
                      final snackBar = SnackBar(
                        content: Container(
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        backgroundColor: Colors.grey,
                        duration: Duration(seconds: 2),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,

                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    } );

                  },

                ),
              ),
              SizedBox(height: height*0.015),
              Row(
                children: <Widget>[
                  const Text(
                    'Does not have an account?',
                    style: TextStyle( fontFamily: 'Poppins-Medium',fontSize: 16.0, color: Colors.black54,),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontWeight: FontWeight.w700,  fontFamily: 'Poppins-Medium',fontSize: 16.0, color: Color.fromRGBO(0, 62, 41, 1),),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: height*0.022),
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
              SizedBox(height: height*0.059),
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
              SizedBox(height: height*0.022),
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
