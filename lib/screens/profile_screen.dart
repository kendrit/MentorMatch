import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_match/main.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../HomeScreen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

String firstname;
String lastname;

Future<void> _addUser(String firstname, String lastname) {
  String fullname = '$firstname $lastname';
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  if (firstname != null) {
    if (lastname != null) {
      users.doc(auth.currentUser.uid).update({'full_name': fullname});
    }
  }
}

File _imageFile;
final ImagePicker _picker = ImagePicker();

class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  String statusChoice;
  String institutionChoice;
  List statusChoices = ['Mentor', 'Mentee', "I don't know"];
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
        print('No Image Path Received');
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
                      'Edit Profile',
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
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: profilePicture(context),
                        onTap: () {
                          takePhoto(ImageSource.gallery);
                        },
                      ),
                      SizedBox(
                        height: 10 * heightFactor,
                      ),
                      Text(
                        'Change your Profile Picture',
                        style: TextStyle(
                            fontSize: 14 * widthFactor,
                            color: Constants.darkgray),
                      ),
                      SizedBox(
                        height: 20 * heightFactor,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('First Name'),
                    Padding(
                        padding: EdgeInsets.only(right: 100 * widthFactor),
                        child: Text('Last Name'))
                  ],
                ),
                SizedBox(height: 5 * heightFactor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                        width: 170.0 * widthFactor,
                        height: 45.0 * heightFactor,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10 * widthFactor,
                            right: 15 * widthFactor,
                            top: 12.5 * heightFactor,
                            bottom: 0 * heightFactor),
                        child: Container(
                          width: 120.0 * widthFactor,
                          child: TextFormField(
                            onChanged: (textValue) {
                              firstname = textValue;
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: 'John',
                              hintStyle: TextStyle(fontSize: 13 * widthFactor),
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
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
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
                            onChanged: (textValue) {
                              lastname = textValue;
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: 'Appleseed',
                              hintStyle: TextStyle(fontSize: 13 * widthFactor),
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
                GestureDetector(
                  onTap: () {
                    try {
                      _addUser(firstname, lastname);
                    } on Exception catch (_) {
                      print('error');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 0 * widthFactor,
                        top: 200 * heightFactor,
                      ),
                      child: Container(
                        child: Center(
                          child: Text(
                            'SAVE PROFILE',
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

  Widget profilePicture(context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return FutureBuilder(
        future: getAvi(),
        builder: (context, snapshot) {
          return CircleAvatar(
            radius: 75 * widthFactor,
            backgroundImage:
                _imageFile == null ? NetworkImage(snapshot.data) : _imageFile,
          );
        });
  }

  pfpGet(String data) {
    if (data != null) {
      return NetworkImage(data);
    } else {
      return AssetImage('assets/images/profile.png');
    }
  }
}
