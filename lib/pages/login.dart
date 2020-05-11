
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences _preferences;
  bool _loading = false;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _isSignedIn();
  }

    void _isSignedIn() async {
        setState(() {
          _loading = true;
        });
        _preferences = await SharedPreferences.getInstance();
        _isLoggedIn = await _googleSignIn.isSignedIn();

        if(_isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
        setState((){
          _loading = false;
        });
      }

      Future _handleSignIn() async{
        _preferences = await SharedPreferences.getInstance();

        setState(() {
         _loading = true; 
        });
        GoogleSignInAccount googleSignInUser = await _googleSignIn.signIn();
        GoogleSignInAuthentication googleAuth = await googleSignInUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
        FirebaseUser firebaseUser = authResult.user;
        
        if(firebaseUser != null){
          final QuerySnapshot result = await Firestore.instance.collection("users").where("id", isEqualTo:firebaseUser.uid).getDocuments();
          final List<DocumentSnapshot> documents = result.documents;
          if(documents.length == 0){
            //insert the user to collection
            Firestore.instance
                  .collection("users")
                  .document(firebaseUser.uid)
                  .setData({
                    "id" : firebaseUser.uid,
                    "username" : firebaseUser.displayName,
                    "profilepicture" : firebaseUser.photoUrl
                  });
                  await _preferences.setString("id", firebaseUser.uid);
                  await _preferences.setString("username", firebaseUser.displayName);
                  await _preferences.setString("photoUrl", firebaseUser.photoUrl);     
          }else{
                  await _preferences.setString("id", documents[0]['id']);
                  await _preferences.setString("username", documents[0]['username']);
                  await _preferences.setString("photoUrl", documents[0]['photoUrl']);
          }
          Fluttertoast.showToast(msg: "Welcome User");
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          setState(() {
           _loading = false; 
          });
        }else{
          
        }
      }

      @override
      Widget build(BuildContext context){
      //  Size size = MediaQuery.of(context).size;

        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.red[900],
                  Colors.red[800],
                  Colors.red[400],
                ]
              )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80,),
                  Padding(
                    padding:EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Login", style: TextStyle(color: Colors.white, fontSize:40),),
                        SizedBox(height:10),
                        Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize:18),),
                      ]
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                        ),
                        child: Padding(
                          padding:EdgeInsets.all(20),
                          child: Column(
                            children:<Widget>[
                              SizedBox(height:60),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:[BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 0.3),
                                      blurRadius: 20,
                                    offset: Offset(0,10)
                                  )] 
                              ),
                              child: Column(
                                children:<Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color:Colors.grey[200]))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email or Mobile Number",
                                        helperStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none)
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color:Colors.grey[200]))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        helperStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              ),
                              SizedBox(height: 40),
                              Text("Forget Password?", style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 40),
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red[900]
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              SizedBox(height: 80),
                             Container(
                               child: Center(
                                 child: FlatButton(
                                   onPressed: (){
                                     _handleSignIn();
                                     },child:Image.asset("images/google.png",)
                                     ),
                                     ),
                                     ),
                                     Visibility(
                     visible: _loading ?? true,
                     child: Container(
                       alignment: Alignment.center,
                        // color: Colors.white.withOpacity(0.7),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                        ),
                     ),
                )
                            ],
                          ),),
                    ),
                  ),

                ],
              ),
          ),
        );
      }
    
    
}