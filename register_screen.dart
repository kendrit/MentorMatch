import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/home_signin_widget.dart';
import 'package:mentor_match/create_login.dart';
import 'package:mentor_match/mentor_match_icons.dart';
import 'menu_frame.dart';
import 'login_screen.dart';

const double space = 20.0;

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, bottom: 30, top: 50),
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Image(
                          //   image: AssetImage('assets/images/MM_LogoRect.png'),
                          //   width: 135,
                          //   height: 115,
                          // ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: space),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 33.0,
                                        fontWeight: FontWeight.normal,
                                        color:
                                            Color.fromRGBO(112, 112, 112, 1.0)),
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
                                      padding: EdgeInsets.only(right: 71),
                                      child: Text('Last Name'))
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Stack(children: <Widget>[
                                    Container(
                                      width: 140.0,
                                      height: 40.0,
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
                                          left: 10,
                                          right: 15,
                                          top: 10,
                                          bottom: 0),
                                      child: Container(
                                        width: 120.0,
                                        child: TextFormField(
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'John',
                                            hintStyle: TextStyle(fontSize: 13),
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
                                      width: 140.0,
                                      height: 40.0,
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
                                          left: 10,
                                          right: 15,
                                          top: 10,
                                          bottom: 0),
                                      child: Container(
                                        width: 90.0,
                                        child: TextFormField(
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Appleseed',
                                            hintStyle: TextStyle(fontSize: 13),
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
                                  Text('Email'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        height: 50.0,
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
                                            left: 10,
                                            right: 15,
                                            top: 15,
                                            bottom: 0),
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  'johnappleseed@example.com',
                                              hintStyle:
                                                  TextStyle(fontSize: 13),
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
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        height: 50.0,
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
                                            left: 10,
                                            right: 15,
                                            top: 15,
                                            bottom: 0),
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  'johnappleseed@example.com',
                                              hintStyle:
                                                  TextStyle(fontSize: 13),
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
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        height: 50.0,
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
                                            left: 10,
                                            right: 15,
                                            top: 15,
                                            bottom: 0),
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: '************',
                                              hintStyle:
                                                  TextStyle(fontSize: 13),
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
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        height: 50.0,
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
                                            left: 10,
                                            right: 15,
                                            top: 15,
                                            bottom: 0),
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: '************',
                                              hintStyle:
                                                  TextStyle(fontSize: 13),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 0,
                                      top: 25,
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      width: 125.0,
                                      height: 45.0,
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
                        ])))));
  }
}
