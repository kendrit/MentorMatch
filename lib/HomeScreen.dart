import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/menu_frame.dart';
import 'package:mentor_match/screens/chat_screen.dart';
import 'package:mentor_match/screens/home_screen.dart';
import 'package:mentor_match/screens/mentor_screen.dart';
import 'package:mentor_match/screens/search_screen.dart';
import 'package:mentor_match/screens/settings_screen.dart';
import 'package:mentor_match/screens/splash_screen.dart';
import 'login_screen.dart';
import 'screens/profile_screen.dart';
import 'register_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'scripts/database_handler.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');
var fullname;
checkUser() async {
  final DocumentSnapshot doc = await users.doc(auth.currentUser.uid).get();
  return [
    auth.currentUser,
    doc.get('full_name').toString(),
    doc.get('status').toString()
  ];
}

getMatches(String userid) async {
  DatabaseHandler().getUserMatches(userid);
}

String aviUrl;
String shtatus;

getUsers([String request, String userQuery]) async {
  final DocumentSnapshot doc = await users.doc(auth.currentUser.uid).get();
  if (userQuery == null) {
    if (request != null) {
      return [doc.get(request).toString()];
    } else {
      return [doc.get('full_name').toString(), doc.get('status').toString()];
    }
  } else {
    final DocumentSnapshot requestedUser = await users.doc(userQuery).get();
    if (request != null) {
      return [requestedUser.get(request).toString()];
    } else {
      return [
        requestedUser.get('full_name').toString(),
        requestedUser.get('status').toString()
      ];
    }
  }
}

getAvi([String userid]) async {
  if (userid != null) {
    return await firebase_storage.FirebaseStorage.instance
        .ref('images/' + userid)
        .getDownloadURL();
  } else {
    return await firebase_storage.FirebaseStorage.instance
        .ref('images/' + auth.currentUser.uid)
        .getDownloadURL();
  }
}

class HomeScreen extends StatelessWidget {
  final UserCredential user;
  HomeScreen({Key key, this.user}) : super(key: key);
  Future userCheck = checkUser();
  @override
  Widget build(BuildContext context) {
    double heightFactor = (MediaQuery.of(context).size.height / 692);
    double widthFactor = (MediaQuery.of(context).size.width / 360);
    return FutureBuilder(
      //Initialize FlutterFire:
      future: userCheck,
      // ignore: missing_return
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('error');
          auth.signOut();
          return MenuFrame();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (auth.currentUser != null) {
            print('signedt in!');
            if (snapshot.data[2] == 'Mentee') {
              return MenteeScreen(
                  heightFactor: heightFactor, widthFactor: widthFactor);
            }

            if (snapshot.data[2] == 'Mentor') {
              return MentorScreen(
                  heightFactor: heightFactor, widthFactor: widthFactor);
            }

            if (snapshot.data[2] == 'Both') {
              return BothScreen(
                  heightFactor: heightFactor, widthFactor: widthFactor);
            }
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
        print('waitingg...');
        return SplashScreen();
      },
    );
  }
}

class MenteeScreen extends StatelessWidget {
  const MenteeScreen({
    Key key,
    @required this.heightFactor,
    @required this.widthFactor,
  }) : super(key: key);

  final double heightFactor;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
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
                    horizontal: 20.0 * widthFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30 * heightFactor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder(
                          future: getAvi(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Container(
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 150.0 * widthFactor,
                                    height: 150.0 * heightFactor,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                height: 40 * heightFactor,
                                width: 40 * widthFactor,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              );
                            } else {
                              return Container(
                                  child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Constants.mainblue),
                              ));
                            }
                          },
                        ),
                        SizedBox(width: 5 * widthFactor),
                        FutureBuilder(
                          future: getUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text.rich(
                                new TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 24 * widthFactor,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    new TextSpan(text: ''),
                                    new TextSpan(
                                      text: '${snapshot.data[0]}',
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
                          },
                        ),
                        SizedBox(width: 38 * widthFactor),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                  child: Image(
                                      width: 30 * widthFactor,
                                      image: AssetImage(
                                          'assets/images/settings.png')),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingsScreen()),
                                    );
                                  }),
                              SizedBox(width: 10 * widthFactor),
                              GestureDetector(
                                child: Image(
                                    width: 30 * widthFactor,
                                    image: AssetImage(
                                        'assets/images/profile.png')),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()),
                                  );
                                },
                              ),
                            ]),
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
                      height: 30.0 * heightFactor,
                    ),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mentors',
                                  style: TextStyle(
                                      color: Constants.darkgray, fontSize: 25),
                                ),
                                Text(
                                  'View and manage your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentorFind()));
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Messages',
                                  style: TextStyle(
                                      color: Constants.darkgray,
                                      fontSize: 25 * widthFactor),
                                ),
                                Text(
                                  'Contact your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            //Replacement(
                            context,
                            MaterialPageRoute(builder: (context) => ChatHome()),
                          );
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                      child: Container(
                        height: 200 * heightFactor,
                        width: 400 * widthFactor,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.mainblue,
                            ),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: EdgeInsets.all(20.0 * widthFactor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Calendar',
                                style: TextStyle(
                                    color: Constants.darkgray,
                                    fontSize: 25 * widthFactor),
                              ),
                              Text(
                                'View scheduled appointments',
                                style: TextStyle(color: Constants.darkgray),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                    ),
                  ],
                )),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wright.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}

class MentorScreen extends StatelessWidget {
  const MentorScreen({
    Key key,
    @required this.heightFactor,
    @required this.widthFactor,
  }) : super(key: key);

  final double heightFactor;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
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
                    horizontal: 20.0 * widthFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30 * heightFactor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder(
                          future: getAvi(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Container(
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 150.0 * widthFactor,
                                    height: 150.0 * heightFactor,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                height: 40 * heightFactor,
                                width: 40 * widthFactor,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              );
                            } else {
                              return Container(
                                  child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Constants.mainblue),
                              ));
                            }
                          },
                        ),
                        SizedBox(width: 5 * widthFactor),
                        FutureBuilder(
                          future: getUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text.rich(
                                new TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 24 * widthFactor,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    new TextSpan(text: ''),
                                    new TextSpan(
                                      text: '${snapshot.data[0]}',
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
                          },
                        ),
                        SizedBox(width: 38 * widthFactor),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                  child: Image(
                                      width: 30 * widthFactor,
                                      image: AssetImage(
                                          'assets/images/settings.png')),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingsScreen()),
                                    );
                                  }),
                              SizedBox(width: 10 * widthFactor),
                              GestureDetector(
                                child: Image(
                                    width: 30 * widthFactor,
                                    image: AssetImage(
                                        'assets/images/profile.png')),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()),
                                  );
                                },
                              ),
                            ]),
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
                      height: 30.0 * heightFactor,
                    ),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mentors',
                                  style: TextStyle(
                                      color: Constants.darkgray, fontSize: 25),
                                ),
                                Text(
                                  'View and manage your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentorFind()));
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Messages',
                                  style: TextStyle(
                                      color: Constants.darkgray,
                                      fontSize: 25 * widthFactor),
                                ),
                                Text(
                                  'Contact your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            //Replacement(
                            context,
                            MaterialPageRoute(builder: (context) => ChatHome()),
                          );
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                      child: Container(
                        height: 200 * heightFactor,
                        width: 400 * widthFactor,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.mainblue,
                            ),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: EdgeInsets.all(20.0 * widthFactor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Calendar',
                                style: TextStyle(
                                    color: Constants.darkgray,
                                    fontSize: 25 * widthFactor),
                              ),
                              Text(
                                'View scheduled appointments',
                                style: TextStyle(color: Constants.darkgray),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                    ),
                  ],
                )),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wright.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}

class BothScreen extends StatelessWidget {
  const BothScreen({
    Key key,
    @required this.heightFactor,
    @required this.widthFactor,
  }) : super(key: key);

  final double heightFactor;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
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
                    horizontal: 20.0 * widthFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30 * heightFactor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder(
                          future: getAvi(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Container(
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 150.0 * widthFactor,
                                    height: 150.0 * heightFactor,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                height: 40 * heightFactor,
                                width: 40 * widthFactor,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              );
                            } else {
                              return Container(
                                  child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Constants.mainblue),
                              ));
                            }
                          },
                        ),
                        SizedBox(width: 5 * widthFactor),
                        FutureBuilder(
                          future: getUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text.rich(
                                new TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 23 * widthFactor,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    new TextSpan(text: 'Hello, '),
                                    new TextSpan(
                                      text: '${snapshot.data[0]}',
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
                          },
                        ),
                        SizedBox(width: 20 * widthFactor),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Image(
                                  width: 30 * widthFactor,
                                  image:
                                      AssetImage('assets/images/settings.png')),
                              SizedBox(width: 10 * widthFactor),
                              GestureDetector(
                                child: Image(
                                    width: 30 * widthFactor,
                                    image: AssetImage(
                                        'assets/images/profile.png')),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()),
                                  );
                                },
                              ),
                            ]),
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
                      height: 30.0 * heightFactor,
                    ),
                    Container(
                      height: 125 * heightFactor,
                      width: 400 * widthFactor,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.mainblue,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0 * widthFactor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mentees',
                              style: TextStyle(
                                  color: Constants.darkgray,
                                  fontSize: 25 * widthFactor),
                            ),
                            Text(
                              'View and manage your Mentees',
                              style: TextStyle(color: Constants.darkgray),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text('Log Out',
                            style: TextStyle(fontSize: 20 * heightFactor)),
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
                    ),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mentors',
                                  style: TextStyle(
                                      color: Constants.darkgray, fontSize: 25),
                                ),
                                Text(
                                  'View and manage your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentorFind()));
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                        child: Container(
                          height: 125 * heightFactor,
                          width: 400 * widthFactor,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.mainblue,
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0 * widthFactor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Messages',
                                  style: TextStyle(
                                      color: Constants.darkgray,
                                      fontSize: 25 * widthFactor),
                                ),
                                Text(
                                  'Contact your Mentors',
                                  style: TextStyle(color: Constants.darkgray),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatHome()),
                          );
                        }),
                    SizedBox(height: 20 * heightFactor),
                    GestureDetector(
                      child: Container(
                        height: 200 * heightFactor,
                        width: 400 * widthFactor,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.mainblue,
                            ),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: EdgeInsets.all(20.0 * widthFactor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Calendar',
                                style: TextStyle(
                                    color: Constants.darkgray,
                                    fontSize: 25 * widthFactor),
                              ),
                              Text(
                                'View scheduled appointments',
                                style: TextStyle(color: Constants.darkgray),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text('Log Out',
                            style: TextStyle(fontSize: 20 * heightFactor)),
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
                    ),
                  ],
                )),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wright.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //     Color.fromRGBO(255, 255, 255, 1.0),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
