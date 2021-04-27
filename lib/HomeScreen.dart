import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/menu_frame.dart';
import 'package:mentor_match/screens/home_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');
var fullname;
checkUser() async {
  return auth.currentUser;
}

getUsers() async {
  final DocumentSnapshot doc = await users.doc(auth.currentUser.uid).get();
  return doc.get('full_name').toString();
}

class HomeScreen extends StatelessWidget {
  final UserCredential user;
  HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double heightFactor = (MediaQuery.of(context).size.height / 692);
    double widthFactor = (MediaQuery.of(context).size.width / 360);
    return FutureBuilder(
      //Initialize FlutterFire:
      future: checkUser(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('error');
          return Container(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Constants.mainblue),
          ));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (auth.currentUser != null) {
            print('signed in!');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MentorMatch',
              theme: ThemeData(
                primaryColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Material(
                child: Container(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0 * heightFactor,
                          horizontal: 30.0 * widthFactor),
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
                              // Text(
                              //   'Hello, ' + fullname,
                              //   style: TextStyle(
                              //       fontSize: 10.0 * widthFactor,
                              //       fontWeight: FontWeight.w400,
                              //       color: Color.fromRGBO(112, 112, 112, 1.0)),
                              // ),
                              FutureBuilder(
                                future: getUsers(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return Text.rich(
                                      new TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 23 * 1.0000000,
                                          color: const Color(0xff707070),
                                        ),
                                        children: [
                                          new TextSpan(text: 'Hello, '),
                                          new TextSpan(
                                            text: '${snapshot.data}',
                                            style: new TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                        child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Constants.mainblue),
                                    ));
                                  }
                                  // return Text(
                                  //   'Hello, ${snapshot.data}',
                                  //   style: TextStyle(
                                  //       fontFamily: 'Segoe UI',
                                  //       fontSize: 20 * widthFactor,
                                  //       color: Colors.black),
                                  // );
                                },
                              ),
                              SizedBox(width: 30 * widthFactor),
                              Row(
                                children: [
                                  Image(
                                      width: 30 * widthFactor,
                                      image: AssetImage(
                                          'assets/images/settings.png')),
                                  SizedBox(width: 10 * widthFactor),
                                  Image(
                                      width: 30 * widthFactor,
                                      image: AssetImage(
                                          'assets/images/profile.png')),
                                ],
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
                                              builder: (context) =>
                                                  HomeScreen()),
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
                                              builder: (context) =>
                                                  HomeScreen()),
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
                                    Row(
                                      children: [
                                        InkWell(
                                          //behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatHome()),
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
                                                      color:
                                                          Constants.maingreen,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                                child: new Center(
                                                  child: new Text(
                                                    "Messages",
                                                    style: TextStyle(
                                                        fontFamily: 'Segoe UI',
                                                        fontSize:
                                                            23 * widthFactor,
                                                        color: Constants
                                                            .maingreen),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
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
                                                builder: (context) =>
                                                    HomeScreen()),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              child: new Center(
                                                child: new Text(
                                                  "My Calendar",
                                                  style: TextStyle(
                                                      fontFamily: 'Segoe UI',
                                                      fontSize:
                                                          23 * widthFactor,
                                                      color:
                                                          Constants.maingreen),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              //Expanded(
                              //  child: PageView(
                              //    children: <Widget>[
                              //      CreateLogin(),
                              //      HomeSignInWidget(),
                              //    ],
                              //  ),
                              //),
                              SizedBox(height: 10),
                              GestureDetector(
                                child: Text('Log Out',
                                    style:
                                        TextStyle(fontSize: 20 * heightFactor)),
                                onTap: () async {
                                  await auth.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuFrame()),
                                  );
                                  print('hello');
                                },
                              ),
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
              ),
            );
          } else {
            print('not signed in!');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MentorMatch',
              theme: ThemeData(
                primaryColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MenuFrame(),
            );
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('waiting...');
        return MaterialApp(
            home: new Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Constants.mainblue),
                  ),
                )));
      },
    );
  }
}
