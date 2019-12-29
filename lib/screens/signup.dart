import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../database/users.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  Firestore _firestore = Firestore();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _cfrmpasswordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String gender ;
  String groupvalue = "male";
  bool loading = false;
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height /3 ;
    return Scaffold(
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
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),


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
                                  border: InputBorder.none,
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
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Container(
                            color: Colors.white.withOpacity(.4),

                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  child: ListTile(
                                    title: Text("male" ,textAlign: TextAlign.end,style: TextStyle(color: Colors.white),),
                                    trailing: Radio(value: "male", groupValue:groupvalue, onChanged: (e)=>valueChanged(e)),
                                  ),
                                ),

                                Expanded(
                                  child: ListTile(
                                    title: Text("female" , textAlign: TextAlign.end,style: TextStyle(color: Colors.white),),
                                    trailing: Radio(value: "female", groupValue:groupvalue, onChanged: (e)=>valueChanged(e)),
                                  ),
                                ),

                              ],
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
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass, // 7ite password mibanch
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
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
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    if(hidePass == true){
                                      hidePass = false;
                                    }else hidePass = true;
                                  });
                                }),
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
                              child: ListTile(
                                title: TextFormField(
                                  controller: _cfrmpasswordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none, // kat7ayad dak  under red lborder likiji mili katkliki
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    } else if(_passwordTextController.text  !=  value){
                                      return "The password don't match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    if(hidePass == true){
                                      hidePass = false;
                                    }else hidePass = true;
                                  });
                                }),
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
                                onPressed: () async{
                                  validateForm();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Sign up",
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
                            child: InkWell(
                                onTap: (){ Navigator.pop(context); },
                                child: Text("Login", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),))
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

  valueChanged(e) {
    if(e == "male"){
      groupvalue = e;
      gender = e;
    }else
       if(e == "female"){
         groupvalue = e;
         gender = e;
       }
  }

  Future validateForm() async{
    FormState formState = _formKey.currentState;
    if(formState.validate()){
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser(); //check if the user exist
      if(user == null){
        firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text
        ).then( (user) => _firestore.collection("users").add({

            "username": _nameTextController.toString(),
            "email": _emailTextController.toString(),
            "userId": user.user.uid,
            "gender":gender.toString(),

          }),
        ).catchError( (er) => {
          print(er.toString())
        });
        Navigator.pushReplacement(context, MaterialPageRoute(   // didn't give the ability to user of comming back to login
            builder: (context)=>HomePage() ));
      }else {
        print("Already exist");
      }
    }
  }
}

