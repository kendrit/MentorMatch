import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/menu_frame.dart';
import 'package:mentor_match/screens/chat_screen.dart';
import 'package:mentor_match/screens/home_screen.dart';
import 'login_screen.dart';
import 'screens/profile_screen.dart';
import 'register_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

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

String aviUrl;
String shtatus;

getUsers() async {
  final DocumentSnapshot doc = await users.doc(auth.currentUser.uid).get();
  return [doc.get('full_name').toString(), doc.get('status').toString()];
}

getAvi() async {
  return await firebase_storage.FirebaseStorage.instance
      .ref('images/' + auth.currentUser.uid)
      .getDownloadURL();
}

class HomeScreen extends StatelessWidget {
  final UserCredential user;
  HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future userCheck = checkUser();
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
          return Container(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Constants.mainblue),
          ));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          String shtatus = snapshot.data[2];
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
                                    width: 150.0,
                                    height: 150.0,
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
                                height: 40,
                                width: 40,
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
                        SizedBox(width: 5),
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
                                  Navigator.pushReplacement(
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
                      height: 125,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
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
                    SizedBox(height: 20),
                    GestureDetector(
                        child: Container(
                          height: 125,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red[500],
                              ),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Messages',
                                  style: TextStyle(
                                      color: Constants.darkgray, fontSize: 25),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ChatHome()),
                          );
                        }),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Calendar',
                              style: TextStyle(
                                  color: Constants.darkgray, fontSize: 25),
                            ),
                            Text(
                              'View scheduled appointments',
                              style: TextStyle(color: Constants.darkgray),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Text('Log Out',
                          style: TextStyle(fontSize: 20 * heightFactor)),
                      onTap: () async {
                        await auth.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MenuFrame()),
                        );
                        print('hello');
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
                              Image(
                                  width: 30 * widthFactor,
                                  image:
                                      AssetImage('assets/images/profile.png')),
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
                      height: 125,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mentees',
                              style: TextStyle(
                                  color: Constants.darkgray, fontSize: 25),
                            ),
                            Text(
                              'View and manage your Mentees',
                              style: TextStyle(color: Constants.darkgray),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 125,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Messages',
                              style: TextStyle(
                                  color: Constants.darkgray, fontSize: 25),
                            ),
                            Text(
                              'Contact your Mentees',
                              style: TextStyle(color: Constants.darkgray),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Calendar',
                              style: TextStyle(
                                  color: Constants.darkgray, fontSize: 25),
                            ),
                            Text(
                              'View scheduled appointments',
                              style: TextStyle(color: Constants.darkgray),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Text('Log Out',
                          style: TextStyle(fontSize: 20 * heightFactor)),
                      onTap: () async {
                        await auth.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MenuFrame()),
                        );
                        print('hello');
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
