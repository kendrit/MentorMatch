import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/home_signin_widget.dart';
import 'package:mentor_match/create_login.dart';
import 'package:mentor_match/mentor_match_icons.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class MenuFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                          SizedBox(height: 85),
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
