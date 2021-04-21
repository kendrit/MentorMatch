import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'HomeScreen.dart';

class QuizEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20.0 * heightFactor, horizontal: 30.0 * widthFactor),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30 * heightFactor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Thank you for registering\nfor Mentor Match!',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 26 * widthFactor,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
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
                  height: 20.0 * heightFactor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Your answers have been recorded \nand your account is complete. You can \ncustomize your account further in your \naccount settings.',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16 * widthFactor,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w300,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 0 * widthFactor,
                        top: 320 * heightFactor,
                      ),
                      child: Container(
                        child: Center(
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 23 * widthFactor,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 200.0 * widthFactor,
                        height: 65.0 * heightFactor,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(41.0),
                          color: Constants.maingreen,
                          border: Border.all(
                              width: 1.0, color: const Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
                ),
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
