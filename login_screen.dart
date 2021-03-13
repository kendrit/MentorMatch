import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/home_signin_widget.dart';
import 'package:mentor_match/create_login.dart';
import 'package:mentor_match/mentor_match_icons.dart';
import 'menu_frame.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 100),
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
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(112, 112, 112, 1.0)),
                      ),
                    )

                    //Text(
                    //  '',
                    //  style: TextStyle(
                    //    fontSize: 35.0,
                    //    fontWeight: FontWeight.normal,
                    //    color: Color.fromRGBO(0, 90, 255, 1.0),
                    //  ),
                    //),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 40, vertical: 20),
                          // ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(132, 132, 132, 1.0)),
                            ),
                          ),
                          SizedBox(height: 3),
                          Stack(children: <Widget>[
                            Container(
                              width: 281.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff707070)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 0),
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Enter your username',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ]),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Column(children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromRGBO(132, 132, 132, 1.0)),
                                ),
                              ),
                              SizedBox(height: 3),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Stack(children: <Widget>[
                                  Container(
                                    width: 281.0,
                                    height: 61.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: const Color(0xffffffff),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff707070)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 20,
                                        bottom: 0),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'Enter your password',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 18,
                                  top: 15,
                                ),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'LOG IN',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  width: 106.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(41.0),
                                    color: Constants.mainblue,
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text(
                                      '- OR SIGN IN WITH -',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/GLogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            width: 2.0,
                                            color: const Color(0xff4cfff6)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/FLogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            width: 2.0,
                                            color: const Color(0xff4cfff6)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ALogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            width: 2.0,
                                            color: const Color(0xff4cfff6)),
                                      ),
                                    ),
                                  ),
                                ],
                              )),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 15),
                          //   child: Image(
                          //     image: AssetImage('assets/images/MM_cool.png'),
                          //     height: 100,
                          //     width: 100,
                          //   ),
                          // ),
                          // Text('Brought to you by Wilbur Wright College',
                          //     style:
                          //         TextStyle(fontSize: 12, color: Colors.grey)),
                        ])
                  ],
                )

                //Expanded(
                //  child: PageView(
                //    children: <Widget>[
                //      CreateLogin(),
                //      HomeSignInWidget(),
                //    ],
                //  ),
                //),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1.0),
              Color.fromRGBO(255, 255, 255, 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
