import 'package:flutter/material.dart';
import 'books_screen.dart';
import 'package:bookfinder/Widgets/input_field.dart';
import 'package:bookfinder/Widgets/clickable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookfinder/Screens/rigester_page.dart';


class MyHomePage extends StatelessWidget {

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<String> signIn(String email,String password) async{

    AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);

    return result.user.uid;
  }
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Container(height: 250,
                      width: 250,
                      child: Image.asset('assets/images/book icon.png')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: InputField(hintText: 'username',textIcon: Icons.email,onChanged: (newEmail){
                    email=newEmail;
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: InputField(hintText: 'password',textIcon: Icons.vpn_key,
                    onChanged: (newPassword){
                      password=newPassword;
                  },)
                ),
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      elevation: 35,
                      onPressed: () async{
                        print(email);
                        print(password);
                        String userValidationID=await signIn(email, password);
                        if(userValidationID!=null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>BooksScreen()));
                        }
                      },
                      child: Text('Log in',
                        style: TextStyle(color: Colors.white),),
                      color: Color(0xff00A388),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('You don\'t have an account ',
                      style: TextStyle(fontSize: 18),),

                    ClickableText(title: 'Rigester',onPressed: (){
                      //open books page without login
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>RigesterPage(),
                      ));
                    }),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('or Login as a ',
                      style: TextStyle(fontSize: 18),),

                    ClickableText(title: 'guest',onPressed: (){
                      //open books page without login
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>BooksScreen(),
                      ));
                    },)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}