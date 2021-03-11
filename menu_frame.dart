import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/home_signin_widget.dart';
import 'package:mentor_match/create_login.dart';
import 'package:mentor_match/mentor_match_icons.dart';

class MenuFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Column(
              children: <Widget>[
                // Image(
                //   image: AssetImage('assets/images/MM_LogoRect.png'),
                //   width: 135,
                //   height: 115,
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome to\nMentor Match',
                      style: TextStyle(
                          fontSize: 33.0,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(112, 112, 112, 1.0)),
                    ),
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
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                          ),
                          InkWell(
                            //behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            splashColor: Colors.red,
                            child: Container(
                              child: Center(
                                child: Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 27,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              width: 313.0,
                              height: 76.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(41.0),
                                color: Constants.mainblue,
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffffffff)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            //behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            splashColor: Colors.red,
                            child: Container(
                              child: Center(
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 27,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              width: 313.0,
                              height: 76.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(41.0),
                                color: Constants.maingreen,
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffffffff)),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          Image(
                            image: AssetImage('assets/images/MM_cool.png'),
                            height: 100,
                            width: 100,
                          ),
                          Text('Brought to you by Wilbur Wright College',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Column(
              children: <Widget>[
                // Image(
                //   image: AssetImage('assets/images/MM_LogoRect.png'),
                //   width: 135,
                //   height: 115,
                // ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 33.0,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(112, 112, 112, 1.0)),
                    ),
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
                SizedBox(
                  height: 25.0,
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
                          Padding(
                            padding: EdgeInsets.only(right: 230, bottom: 5),
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
                            padding:
                                EdgeInsets.only(right: 230, bottom: 5, top: 15),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(132, 132, 132, 1.0)),
                            ),
                          ),
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
                                  hintText: 'Enter your password',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ]),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 150, top: 15),
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
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              '- OR SIGN IN WITH -',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 32, top: 15),
                              child: Row(
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

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Column(
              children: <Widget>[
                // Image(
                //   image: AssetImage('assets/images/MM_LogoRect.png'),
                //   width: 135,
                //   height: 115,
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 33.0,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(112, 112, 112, 1.0)),
                    ),
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
                SizedBox(
                  height: 25.0,
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
                          Padding(
                            padding: EdgeInsets.only(right: 250, bottom: 5),
                            child: Text(
                              'Email',
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
                                  hintText: 'Enter your email address',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ]),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 230, bottom: 5, top: 15),
                            child: Text(
                              'Confirm Email',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(132, 132, 132, 1.0)),
                            ),
                          ),
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
                                  hintText: 'Confirm your email address',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ]),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 150, top: 15),
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
                                width: 106.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(41.0),
                                  color: Constants.maingreen,
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xffffffff)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              '- OR SIGN IN WITH -',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 32, top: 15),
                              child: Row(
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
