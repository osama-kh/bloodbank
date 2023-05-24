import 'package:bloodbank/auth-service.dart';
import 'package:bloodbank/worngDialgo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission_handler/permission_handler.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Sign_in> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool showSpinner = false;
  bool obscure = true;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(245),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: CircularProgressIndicator(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.lightBlueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          height: 150.0,
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/blood_bank.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        showSpinner = false;
                      });
                      return 'Please Enter your Email.';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 239, 248),
                    labelText: "Enter your Email",
                    prefixIcon: Icon(Icons.email),
                    //hintText: 'Enter your email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: obscure,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        showSpinner = false;
                      });
                      return 'Please Enter your Password.';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 239, 248),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off),
                    ),
                    labelText: "Enter your password.",
                    prefixIcon: Icon(Icons.lock),
                    //hintText: 'Enter your password.',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'forgotpassword');
                    },
                    child: Text('Forgot password?'),
                  ),
                  height: 35,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          final dataUser = await _firestore
                              .collection('userData')
                              .doc(email)
                              .get();
                          final String typeUser = dataUser.data()!['typeUser'];
                          if (user != null) {
                            print(email);
                            Navigator.pushNamed(context, 'userPage',
                                arguments: typeUser);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                          print("Error-----------------");
                          setState(() {
                            showSpinner = false;
                          });
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => worngDialgo(
                                  text: 'Email or password is invalid.'));
                          print(e);
                        }
                      },
                      minWidth: 400.0,
                      height: 42.0,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
