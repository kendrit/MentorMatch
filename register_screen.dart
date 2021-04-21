import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:mentor_match/QuizHome.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;
String email;
String emailConfirm;
String password;
String passwordConfirm;
bool saveAttempted = false;
final formKey = GlobalKey<FormState>();

/*
void _createUser(String mail, String pw) {
  _auth
      .createUserWithEmailAndPassword(email: mail, password: pw)
      .then((authResult) {
    print('yay! ${authResult.user}');
  }).catchError((err) {
    print(err);
  });
} */

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    double space = 20.0 * heightFactor;
    return Form(
        key: formKey,
        child: Material(
            child: Container(
                child: SafeArea(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 30 * widthFactor,
                            right: 30 * widthFactor,
                            bottom: 5 * heightFactor,
                            top: 5 * heightFactor),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: space),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 33.0 * widthFactor,
                                      fontWeight: FontWeight.w500,
                                      color: Constants.darkgray,
                                    ),
                                  ),
                                )
                              ]),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('First Name'),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          right: 70 * widthFactor),
                                      child: Text('Last Name'))
                                ],
                              ),
                              SizedBox(height: 5 * heightFactor),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Stack(children: <Widget>[
                                    Container(
                                      width: 170.0 * widthFactor,
                                      height: 45.0 * heightFactor,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xff707070)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10 * widthFactor,
                                          right: 15 * widthFactor,
                                          top: 12.5 * heightFactor,
                                          bottom: 0 * heightFactor),
                                      child: Container(
                                        width: 120.0 * widthFactor,
                                        child: TextFormField(
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'John',
                                            hintStyle: TextStyle(
                                                fontSize: 13 * widthFactor),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                  Stack(children: <Widget>[
                                    Container(
                                      width: 170.0 * widthFactor,
                                      height: 45.0 * heightFactor,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xff707070)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10 * widthFactor,
                                          right: 15 * widthFactor,
                                          top: 12.5 * heightFactor,
                                          bottom: 0 * heightFactor),
                                      child: Container(
                                        width: 90.0 * widthFactor,
                                        child: TextFormField(
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Appleseed',
                                            hintStyle: TextStyle(
                                                fontSize: 13 * widthFactor),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                              SizedBox(height: space),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Email (School or Work)'),
                                ],
                              ),
                              SizedBox(height: 5 * heightFactor),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 351.0 * widthFactor,
                                        height: 50.0 * heightFactor,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: const Color(0xffffffff),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10 * widthFactor,
                                            right: 15 * widthFactor,
                                            top: 15 * heightFactor,
                                            bottom: 0 * heightFactor),
                                        child: Container(
                                          width: 326.0 * widthFactor,
                                          child: TextFormField(
                                            autovalidate: saveAttempted,
                                            onChanged: (textValue) {
                                              email = textValue;
                                            },
                                            validator: (emailValue) {
                                              if (emailValue.isEmpty) {
                                                return '\nThis field is mandatory';
                                              }
                                              String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                                                  "\\@" +
                                                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                                  "(" +
                                                  "\\." +
                                                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                                                  ")+";
                                              RegExp regExp = new RegExp(p);

                                              if (regExp.hasMatch(emailValue)) {
                                                // So, the email is valid
                                                return null;
                                              }
                                              return '\nThis is not a valid email';
                                            },
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  'johnappleseed@example.com',
                                              hintStyle: TextStyle(
                                                  fontSize: 13 * widthFactor),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]),
                              SizedBox(height: space),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Confirm Email'),
                                ],
                              ),
                              SizedBox(height: 5 * heightFactor),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 351.0 * widthFactor,
                                        height: 50.0 * heightFactor,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: const Color(0xffffffff),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10 * widthFactor,
                                            right: 15 * widthFactor,
                                            top: 15 * heightFactor,
                                            bottom: 0 * heightFactor),
                                        child: Container(
                                          width: 326.0 * widthFactor,
                                          child: TextFormField(
                                            autovalidate: saveAttempted,
                                            onChanged: (textValue) {
                                              emailConfirm = textValue;
                                            },
                                            validator: (emailConfValue) {
                                              if (emailConfValue != email) {
                                                return '\nEmail addresses must match';
                                              }
                                              return null;
                                            },
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  'johnappleseed@example.com',
                                              hintStyle: TextStyle(
                                                  fontSize: 13 * widthFactor),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]),
                              SizedBox(height: space),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Password'),
                                ],
                              ),
                              SizedBox(height: 5 * heightFactor),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 351.0 * widthFactor,
                                        height: 50.0 * heightFactor,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: const Color(0xffffffff),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10 * widthFactor,
                                            right: 15 * widthFactor,
                                            top: 15 * heightFactor,
                                            bottom: 0 * heightFactor),
                                        child: Container(
                                          width: 326.0 * widthFactor,
                                          child: TextFormField(
                                            autovalidate: saveAttempted,
                                            onChanged: (textValue) {
                                              password = textValue;
                                            },
                                            validator: (passwordValue) {
                                              if (passwordValue.isEmpty) {
                                                return '\nThis field is mandatory';
                                              }
                                              if (passwordValue.length < 8) {
                                                return '\nPassword must be at least 8 characters';
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: '************',
                                              hintStyle: TextStyle(
                                                  fontSize: 13 * widthFactor),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]),
                              SizedBox(height: space),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Confirm Password'),
                                ],
                              ),
                              SizedBox(height: 5 * heightFactor),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 0),
                                        child: Container(
                                          width: 351.0 * widthFactor,
                                          height: 50.0 * heightFactor,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: const Color(0xffffffff),
                                            border: Border.all(
                                                width: 1.0,
                                                color: const Color(0xff707070)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10 * widthFactor,
                                            right: 15 * widthFactor,
                                            top: 15 * heightFactor,
                                            bottom: 0 * heightFactor),
                                        child: Container(
                                          width: 326.0 * widthFactor,
                                          child: TextFormField(
                                            autovalidate: saveAttempted,
                                            onChanged: (textValue) {
                                              passwordConfirm = textValue;
                                            },
                                            validator: (passwordConfValue) {
                                              if (passwordConfValue !=
                                                  password) {
                                                return '\nPasswords must match';
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: '************',
                                              hintStyle: TextStyle(
                                                  fontSize: 13 * widthFactor),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  saveAttempted = true;
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    //_createUser(email, password);
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 0 * widthFactor,
                                      top: space,
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 22 * widthFactor,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      width: 150.0 * widthFactor,
                                      height: 60.0 * heightFactor,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(41.0),
                                        color: Constants.maingreen,
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffffffff)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]))))));
  }
}
