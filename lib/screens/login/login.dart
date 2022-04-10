import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tic_tac_toe/rounded_btn/rounded_btn.dart';
import 'package:tic_tac_toe/screens/create_account/create_account.dart';
import 'package:tic_tac_toe/screens/home_screen/view/home_screen.dart';
import 'package:tic_tac_toe/utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  TextEditingController emailCont = TextEditingController();
TextEditingController passCont = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xff251F34),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 175,
                    height: 175,
                    child: SvgPicture.asset('assets/images/login.svg')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                  child: Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Please sign in to continue.',
                      style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13
                  ),
        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'E-mail',
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailCont,
                          validator: (value)=> Validator().emailValidator(value!),
                          style: (TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w400
                          )),
                          keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3B324E),
                                filled: true,
                            prefixIcon: Image.asset('assets/images/icon_email.png'),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passCont,
                        validator: (value)=> Validator().passwordValidator(value!),
                        style: (TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        )),
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3B324E),
                          filled: true,
                          prefixIcon: Image.asset('assets/images/icon_lock.png'),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RoundedButton(
                      btnText: 'LOGIN',
                      color: Color(0xff14DAE2),
                      onPressed: () async {
                        // Add login code
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: emailCont.text, password: passCont.text);
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                ),
                Center(
                  child: Text('Forgot Password?',
                  style: TextStyle(
                    color: Color(0xff14DAE2)
                  ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400
                      ),),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccount()));
                      },
                      child: Text('Sign up',
                        style: TextStyle(
                            color: Color(0xff14DAE2),)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
