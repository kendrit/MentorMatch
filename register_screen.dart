import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_match/constants.dart';
import 'QuizHome.dart';
// import 'package:mentor_match/home_signin_widget.dart';
// import 'package:mentor_match/create_login.dart';
// import 'package:mentor_match/mentor_match_icons.dart';
// import 'menu_frame.dart';
// import 'login_screen.dart';

const double space = 20.0;

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    print('Hello');
    return Material(
        child: Container(
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 30 * heightFactor,
                        top: 50 * heightFactor),
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
                                      padding: EdgeInsets.only(right: 101),
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
                                          left: 10,
                                          right: 15,
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
                                  Text('Email'),
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
                              SizedBox(height: 5),
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuizHome()),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 0 * widthFactor,
                                      top: 25 * heightFactor,
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 20 * widthFactor,
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
                        ])))));
  }
}
