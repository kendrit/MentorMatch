import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'QuizEnd.dart';

class MenteeQuizPage3 extends StatefulWidget {
  @override
  createState() {
    return new MenteeQuizPage3State();
  }
}

Future<void> _addUser(String label, String value) async {
  String fullname = '$firstname $lastname';
  CollectionReference userdata =
      FirebaseFirestore.instance.collection('userdata');
  userdata.doc(auth.currentUser.uid).update({label: value}).catchError(
      (error) => userdata.doc(auth.currentUser.uid).set({label: value}));
}

class MenteeQuizPage3State extends State<MenteeQuizPage3> {
  String driveChoice;
  String drive;
  String live;
  String liveChoice;
  String self;
  String selfChoice;
  List<String> _data1 = new List<String>();
  List<String> _data2 = new List<String>();
  List<String> _data3 = new List<String>();
  List<QuestionList> _question = new List<QuestionList>();

  final ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data1.add('Listening to music');
    _data1.add('Listening to a podcast');
    _data1.add('Thinking about responsibilities/multitasking');
    _data1.add('I despise driving');

    _data2.add('A location that is best for my family');
    _data2.add('A location that is a good balance for my family and career');
    _data2.add('A location that is best for my career');
    _data2.add(
        'I would try to make everything work in a specific location I enjoy');

    _data3.add(
        'I am willing to sacrifice my comfort in order to make the world a better place.');
    _data3.add(
        'I want to go out of my way to help the world around me, but only after making sure I am comfortable.');
    _data3.add(
        'I will choose/have chosen an employer that will help make the world a better place, and trust that my work with them is enough.');
    _data3.add('I do not have any preference on my career and its impact.');

    _question.add(new QuestionList(
        'On a long car ride alone, which of these would you',
        ' most prefer?',
        'driving choice'));
    _question.add(new QuestionList('If you could live anywhere, ',
        'where would you live?', 'living choice'));
    _question.add(new QuestionList(
        'Which of these ', 'best describe you?', 'future choice'));
  }

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
            padding: EdgeInsets.only(
              left: 15 * widthFactor,
              right: 15 * widthFactor,
              top: 25 * heightFactor,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Education and Career',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 28 * widthFactor,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0 * heightFactor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Help us find the perfect match for you!',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14 * widthFactor,
                        color: const Color(0xff707070),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0 * heightFactor),
                Center(
                    child: Column(
                  children: <Widget>[
                    new Question(_question[0]),
                    DropdownButton(
                        hint: Text('Select Items: '),
                        value: driveChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            driveChoice = newValue;
                            drive = driveChoice;
                            _addUser(_question[0].value, newValue);
                            print('state set');
                          });
                        },
                        items: _data1.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList()),
                    new Question(_question[1]),
                    DropdownButton(
                        hint: Text('Select Items: '),
                        value: liveChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            liveChoice = newValue;
                            live = liveChoice;
                            _addUser(_question[1].value, newValue);
                            print('state set');
                          });
                        },
                        items: _data2.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList()),
                    new Question(_question[2]),
                    DropdownButton(
                        hint: Text('Select Items: '),
                        value: selfChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            selfChoice = newValue;
                            self = selfChoice;
                            _addUser(_question[2].value, newValue);
                            print('state set');
                          });
                        },
                        items: _data3.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizEnd()),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 0 * widthFactor,
                            top: 0 * heightFactor,
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 24 * widthFactor,
                                  color: const Color(0xff707070),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            width: 140.0 * widthFactor,
                            height: 50.0 * heightFactor,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(41.0 * widthFactor),
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
