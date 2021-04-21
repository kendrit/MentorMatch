import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightFactor = (MediaQuery.of(context).size.height / 692);
    double widthFactor = (MediaQuery.of(context).size.width / 360);
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20.0 * heightFactor, horizontal: 30.0 * widthFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image(
                //   image: AssetImage('assets/images/MM_LogoRect.png'),
                //   width: 135,
                //   height: 115,
                // ),
                SizedBox(
                  height: 30 * heightFactor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello, User',
                      style: TextStyle(
                          fontSize: 33.0 * widthFactor,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(112, 112, 112, 1.0)),
                    ),
                    SizedBox(width: 60 * widthFactor),
                    Image(
                        width: 30 * widthFactor,
                        image: AssetImage('assets/images/settings.png')),
                    SizedBox(width: 15 * widthFactor),
                    Image(
                        width: 30 * widthFactor,
                        image: AssetImage('assets/images/profile.png')),
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
                  height: 40.0 * heightFactor,
                ),
                Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            //behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            splashColor: Colors.red,
                            child: Container(
                              height: 150.0 * heightFactor,
                              width: 150.0 * widthFactor,
                              color: Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Constants.maingreen,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: new Center(
                                    child: new Text(
                                      "Mentors",
                                      style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 23 * widthFactor,
                                          color: Constants.maingreen),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10.0 * heightFactor,
                          ),
                          InkWell(
                            //behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            splashColor: Colors.red,
                            child: Container(
                              height: 150.0 * heightFactor,
                              width: 150.0 * widthFactor,
                              color: Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Constants.maingreen,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: new Center(
                                    child: new Text(
                                      "Friends",
                                      style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 23 * widthFactor,
                                          color: Constants.maingreen),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 7 * widthFactor),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            //behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            splashColor: Colors.red,
                            child: Container(
                              height: 310.0 * heightFactor,
                              width: 140.0 * widthFactor,
                              color: Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Constants.maingreen,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: new Center(
                                    child: new Text(
                                      "Messages",
                                      style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 23 * widthFactor,
                                          color: Constants.maingreen),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(height: 7 * heightFactor),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              //behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              splashColor: Colors.red,
                              child: Container(
                                height: 140.0 * heightFactor,
                                width: 300.0 * widthFactor,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Constants.maingreen,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: new Center(
                                      child: new Text(
                                        "My Calendar",
                                        style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontSize: 23 * widthFactor,
                                            color: Constants.maingreen),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
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
                )
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
