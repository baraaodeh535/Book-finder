import 'package:flutter/material.dart';
import 'books_screen.dart';
import 'package:bookfinder/Widgets/input_field.dart';
import 'package:bookfinder/Widgets/clickable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RigesterPage extends StatelessWidget {

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<String> signIn(String email,String password) async{

    AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);

    return result.user.uid;
  }

  Future<String> signUp(String email,String password) async{
    AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);


    return result.user.uid;
  }
  String email;
  String password;
  String confirmPassword;

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
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                  child: InputField(hintText: 'username',textIcon: Icons.email,onChanged: (newEmail){
                    email=newEmail;
                  },),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                    child: InputField(hintText: 'password',textIcon: Icons.vpn_key,
                      onChanged: (newPassword){
                        password=newPassword;
                      },)
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                    child: InputField(hintText: 'confirm password',textIcon: Icons.vpn_key,
                      onChanged: (newPassword){
                        confirmPassword=newPassword;
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
                        if(password==confirmPassword && password!=''){
                          String userValidationID=await signUp(email, password);
                          if(userValidationID!=null){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>BooksScreen()));
                          }

                        }

                      },
                      child: Text('Rigester',
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
                    Text('You have an account ',
                      style: TextStyle(fontSize: 18),),

                    ClickableText(title: 'Login',),
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