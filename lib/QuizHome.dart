import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final FirebaseAuth auth = FirebaseAuth.instance;
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;
Future<void> _addUser(String firstname, String lastname, String status,
    String institution) async {
  String fullname = '$firstname $lastname';
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.doc(auth.currentUser.uid).set({
    'full_name': fullname,
    'email': auth.currentUser.email,
    'status': status,
    'institution': institution
  }).catchError((error) => print('$error'));
}

getAvi() async {
  return await firebase_storage.FirebaseStorage.instance
      .ref('images/' + auth.currentUser.uid)
      .getDownloadURL();
}

File _imageFile;
final ImagePicker _picker = ImagePicker();

class QuizHome extends StatefulWidget {
  QuizHome({Key key, @required this.email, @required this.fullname})
      : super(key: key);
  final String email;
  final String fullname;

  @override
  QuizHomeState createState() => QuizHomeState();
}

class QuizHomeState extends State<QuizHome> {
  String statusChoice;
  String institutionChoice;
  List statusChoices = ['Mentor', 'Mentee', "Both"];
  List institutionChoices = ['Wilbur Wright College'];
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    void takePhoto(ImageSource source) async {
      final pickedphoto = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      //       .then((image) {
      // _imageFile = image;
      // print(image);
      setState(() {
        _imageFile = pickedphoto;
      });
      if (pickedphoto != null) {
        //Upload to Firebase
        var snapshot = await storage
            .ref()
            .child('images/' + auth.currentUser.uid)
            .putFile(_imageFile);
        var downloadUrl = await snapshot.ref.getDownloadURL();
      } else {
        var snapshot = await storage
            .ref()
            .child('images/' + auth.currentUser.uid)
            .putFile(File('assets/images/profile.png'));
      }
    }

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
                      'One more step...',
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
                      'To complete the creation of your account,\nwe will have you answer a series of \nquestions that will help us calibrate\nyour experience.\n\nPlease be as honest as possible to ensure \nan accurate match.',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First, input your status and university. Then\nyou can press "Begin Survey".',
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
                SizedBox(height: 20 * heightFactor),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Choose your status: '),
                        DropdownButton(
                            hint: Text('Select Items: '),
                            value: statusChoice,
                            onChanged: (newValue) {
                              setState(() {
                                print('state changing');
                                statusChoice = newValue;
                                status = statusChoice;
                                print('state set');
                              });
                            },
                            items: statusChoices.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem, child: Text(valueItem));
                            }).toList()),
                      ],
                    ),
                    SizedBox(width: 40 * widthFactor),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choose your university: '),
                        Container(
                          child: DropdownButton(
                              hint: Text('Select Items: '),
                              value: institutionChoice,
                              onChanged: (newValue) {
                                setState(() {
                                  print('state changing');
                                  institutionChoice = newValue;
                                  institution = institutionChoice;
                                  print('state set');
                                });
                              },
                              items: institutionChoices.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList()),
                        ),
                      ],
                    ),
                    // DropdownButton<String>(
                    //   items: <String>['Mentor', 'Mentee', 'Other']
                    //       .map((String status) {
                    //     return new DropdownMenuItem<String>(
                    //       value: status,
                    //       child: new Text(status),
                    //     );
                    //   }).toList(),
                    //   onChanged: (_) {},
                    // ),
                  ],
                ),
                SizedBox(
                  height: 15 * heightFactor,
                ),
                GestureDetector(
                  child: profilePicture(context),
                  onTap: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),
                SizedBox(
                  height: 15 * heightFactor,
                ),
                Center(child: Text('Choose a Profile Picture')),
                GestureDetector(
                  onTap: () {
                    try {
                      _addUser(firstname, lastname, status, institution);
                    } on Exception catch (_) {
                      print('error');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizPage1(status)),
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 0 * widthFactor,
                        top: 50 * heightFactor,
                      ),
                      child: Container(
                        child: Center(
                          child: Text(
                            'BEGIN SURVEY',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 27 * widthFactor,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 300.0 * widthFactor,
                        height: 70.0 * heightFactor,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(41.0 * widthFactor),
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

Widget profilePicture(context) {
  double heightFactor =
      (MediaQuery.of(context).size.height / 683.4285714285714);
  double widthFactor = (MediaQuery.of(context).size.width / 411.42857142857144);
  return FutureBuilder(
      future: getAvi(),
      builder: (context, snapshot) {
        return CircleAvatar(
            radius: 50 * widthFactor,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/images/profile.png')
                : FileImage(File(_imageFile.path)));
      });
}
