import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogdin = false;

  @override
  void initState(){
    super.initState();
    isSignedIn();

  }

  void isSignedIn() async{
    setState(() {
      loading=true;
    });
    preferences= await SharedPreferences.getInstance();
    isLogdin = await googleSignIn.isSignedIn(); // shek if the user sign in or not

    await firebaseAuth.currentUser().then((user){
      if(user !=null){
        setState(() => isLogdin = true);
      }
    });
    if(isLogdin){
      Navigator.pushReplacement(context, MaterialPageRoute(   // didn't give the ability to user of comming back to login
          builder: (context)=>HomePage(),
      ));
    }

    setState(() {
      loading=false;
    });
  }

  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });


    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;

/*
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =await googleUser.authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken:googleSignInAuthentication.idToken,
        accessToken:googleSignInAuthentication.accessToken,
    );
*/

    if(firebaseUser !=null){
      final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;

      if(documents.length ==0){
//     INSERT THE USER TO OUR COLLECTION
      Firestore.instance.collection('users').document(firebaseUser.uid).setData({
        "id" : firebaseUser.uid,
        "username":firebaseUser.displayName,
        "profilePicture":firebaseUser.photoUrl,
      });
      await preferences.setString("id",firebaseUser.uid );
      await preferences.setString("username",firebaseUser.displayName );
      await preferences.setString("photoUrl",firebaseUser.photoUrl );
      }else{
        await preferences.setString("id",documents[0]["id"] );
        await preferences.setString("username",documents[0]["username"] );
        await preferences.setString("photoUrl",documents[0]["photoUrl"] );
      }

      Fluttertoast.showToast(msg: "Login was Succesful");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage() ,));

  }else{
      Fluttertoast.showToast(msg: "Login failed ):");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Login ',style: TextStyle(color: Colors.red.shade900),),
      ), */

      body: Stack(
        children: <Widget>[
          Image.asset('assets/images2/vback.jpeg',fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images2/rmlogo.png',
                width: 280.0,
                height: 240.0,
              )),


          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  } return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _passwordTextController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
//                          Expanded(child: Container()),

                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp() ));
                                },
                                child: Text("Sign up", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),))
                        ),

                        Divider( height: 50.0,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue.shade900,
                              elevation: 0.0,

                              child: MaterialButton(
                                onPressed: (){
                                  handleSignIn();
                                },
                                minWidth: MediaQuery.of(context).size.width, // take the width of existing things
                                child: Text("Google",
                                  textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                              )
                          ),
                        ),

                      ],
                    )),
              ),
            ),

          ),


          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child:  CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),

      /*


      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 8.0,bottom: 8.0),
          child: FlatButton(
            color: Colors.red.shade900,
            onPressed: (){}
            ,child: Text("Sign in with google",style: TextStyle(color: Colors.white),),
          ),
        ),
      ),*/

    );
  }


}
