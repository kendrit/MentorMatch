import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'quiz_page3_mentee.dart';
import 'quiz_page3_mentor.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'QuizEnd.dart';

class MentorQuizPage2 extends StatefulWidget {
  @override
  createState() {
    return new MentorQuizPage2State();
  }
}

Future<void> _addUser(String label, String value) async {
  String fullname = '$firstname $lastname';
  CollectionReference userdata =
      FirebaseFirestore.instance.collection('userdata');
  userdata.doc(auth.currentUser.uid).update({label: value}).catchError(
      (error) => userdata.doc(auth.currentUser.uid).set({label: value}));
}

class MentorQuizPage2State extends State<MentorQuizPage2> {
  String majorChoice;
  String major;
  String field;
  String fieldChoice;
  String lifeChoice;
  String team;
  String teamChoice;
  List<String> _data0 = new List<String>();
  List<String> _data1 = new List<String>();
  List<String> _data2 = new List<String>();
  List<RadioModel> _data3 = new List<RadioModel>();
  List<QuestionList> _question = new List<QuestionList>();

  final ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data1.add('Mechanical');
    _data1.add('Electrical');
    _data1.add('Civil');
    _data1.add('Software');
    _data1.add('Chemical');

    _data2.add('Academia');
    _data2.add('Governmental');
    _data2.add('Non-Profit');
    _data2.add('Private');
    _data2.add('Entrepeneurship');

    _data0.add('I have earned my degree and am employed in my field.');
    _data0
        .add('I have earned my degree and am searching for a job in my field.');
    _data0.add('I am a student, and am unemployed.');
    _data0.add(
        'I am a student, and am employed in a field related to my degree.');
    _data0.add(
        'I am an employee in a related field, and I am also a part-time student.');
    _data0.add(
        'I am an employee in an unrelated field, and I am also a part-time student.');
    _data0.add('I am an unemployed, part-time student.');

    _data3.add(new RadioModel(false, 'Strongly Disagree', '0'));
    _data3.add(new RadioModel(false, 'Disagree', '1'));
    _data3.add(new RadioModel(false, 'Not Sure', '2'));
    _data3.add(new RadioModel(false, 'Agree', '3'));
    _data3.add(new RadioModel(false, 'Strongly Agree', '4'));

    _question.add(new QuestionList('Which of these best represents the ',
        'field you work in currently?', 'work field'));
    _question.add(new QuestionList(
        'Which best represents your current ', 'work type?', 'work type'));
    _question.add(new QuestionList('Which best represents the ',
        'stage your career is in?', 'career stage'));
    _question.add(
        new QuestionList('I prefer to ', 'work in a team.', 'team preference'));
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
                        value: majorChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            majorChoice = newValue;
                            major = majorChoice;
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
                        value: fieldChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            fieldChoice = newValue;
                            field = fieldChoice;
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
                        value: lifeChoice,
                        onChanged: (newValue) {
                          setState(() {
                            print('state changing to ' + newValue);
                            lifeChoice = newValue;
                            _addUser(_question[2].value, newValue);
                            print('state set');
                          });
                        },
                        items: _data0.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList()),
                    new Question(_question[3]),
                    Container(
                      height: 100 * heightFactor,
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _data3.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  //highlightColor: Colors.blue,
                                  //splashColor: Colors.blueAccent,
                                  onTap: () {
                                    setState(() {
                                      _data3.forEach((element) => element
                                              .isSelected =
                                          false); //sets all buttons, including itself, to "false"
                                      _data3[index].isSelected =
                                          true; //sets itself to "true"
                                      _addUser(_question[2].value,
                                          _data3[index].value);
                                    });
                                  },
                                  child: new RadioItem2(_data3[index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorQuizPage3()),
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
