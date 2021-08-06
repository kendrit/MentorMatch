import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/quiz_page2_mentee.dart';
import 'login_screen.dart';
import 'quiz_page2_mentor.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'QuizEnd.dart';

class QuizPage1 extends StatefulWidget {
  QuizPage1(String status);

  @override
  createState() {
    return new QuizPage1State();
  }
}

Future<void> _addUser(String label, String value) async {
  String fullname = '$firstname $lastname';
  CollectionReference userdata =
      FirebaseFirestore.instance.collection('userdata');
  userdata.doc(auth.currentUser.uid).update({label: value}).catchError(
      (error) => userdata.doc(auth.currentUser.uid).set({label: value}));
}

class QuizPage1State extends State<QuizPage1> {
  List<RadioModel> questiondata1 = new List<RadioModel>();
  List<RadioModel> questiondata2 = new List<RadioModel>();
  List<RadioModel> questiondata3 = new List<RadioModel>();
  List<QuestionList> question = new List<QuestionList>();

  final ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questiondata1.add(new RadioModel(false, "Male", "male"));
    questiondata1.add(new RadioModel(false, "Female", "female"));
    questiondata1.add(new RadioModel(false, "Non-Binary", "nonbinary"));
    questiondata1
        .add(new RadioModel(false, "Prefer not to say", "prefernottosay"));
    questiondata2.add(new RadioModel(false, "White", "white"));
    questiondata2.add(new RadioModel(false, "Black", "black"));
    questiondata2.add(new RadioModel(false, "Hispanic/Latinx", "latinx"));
    questiondata2.add(new RadioModel(false, "Asian", "asian"));
    questiondata2.add(new RadioModel(false, "Native American", "native"));
    questiondata2.add(new RadioModel(false, "Pacific Islander", "pacific"));
    questiondata2.add(new RadioModel(false, "Other", "other"));
    questiondata3.add(new RadioModel(false, "Associates", "associates"));
    questiondata3.add(new RadioModel(false, "Bachelors", "bachelors"));
    questiondata3.add(new RadioModel(false, "Masters", "masters"));
    questiondata3.add(new RadioModel(false, "Ph.D", "phd"));
    question.add(new QuestionList('How', ' old are you?', 'age'));
    question.add(
        new QuestionList('Which gender ', 'do you identify with?', 'gender'));
    question.add(new QuestionList('What is your', ' ethnicity?', 'ethnicity'));
    question.add(new QuestionList('What is the ',
        'highest level of education that you have earned?', 'education'));
  }

  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    //double heightFactor = (MediaQuery.of(context).size.height / 692.0); // height factor
    //double widthFactor = (MediaQuery.of(context).size.width / 360.0); // width factor
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
                      'Personality Questions',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 28 * widthFactor,
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
                    new Question(question[0]),
                    Container(
                      child: new TextField(
                        controller: ageController,
                        decoration: new InputDecoration(labelText: "Age"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ),
                    SizedBox(height: 10 * heightFactor),
                    new Question(question[1]),
                    SizedBox(height: 10 * heightFactor),
                    Container(
                      height: 100 * heightFactor,
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: questiondata1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  //highlightColor: Colors.blue,
                                  //splashColor: Colors.blueAccent,
                                  onTap: () {
                                    setState(() {
                                      questiondata1.forEach((element) => element
                                              .isSelected =
                                          false); //sets all buttons, including itself, to "false"
                                      questiondata1[index].isSelected =
                                          true; //sets itself to "true"
                                      _addUser(question[1].value,
                                          questiondata1[index].value);
                                    });
                                  },
                                  child: new RadioItem2(questiondata1[index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    new Question(question[2]),
                    SizedBox(height: 10 * heightFactor),
                    Container(
                      height: 100 * heightFactor,
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: questiondata2.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  //highlightColor: Colors.blue,
                                  //splashColor: Colors.blueAccent,
                                  onTap: () {
                                    setState(() {
                                      questiondata2.forEach((element) => element
                                              .isSelected =
                                          false); //sets all buttons, including itself, to "false"
                                      questiondata2[index].isSelected =
                                          true; //sets itself to "true"
                                    });
                                    _addUser(question[2].value,
                                        questiondata2[index].value);
                                  },
                                  child: new RadioItem2(questiondata2[index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    new Question(question[3]),
                    SizedBox(height: 10 * heightFactor),
                    Container(
                      height: 100 * heightFactor,
                      child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: questiondata3.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    //highlightColor: Colors.blue,
                                    //splashColor: Colors.blueAccent,
                                    onTap: () {
                                      setState(() {
                                        questiondata3.forEach((element) => element
                                                .isSelected =
                                            false); //sets all buttons, including itself, to "false"
                                        questiondata3[index].isSelected =
                                            true; //sets itself to "true"
                                      });
                                      _addUser(question[3].value,
                                          questiondata3[index].value);
                                      _addUser(question[0].value,
                                          ageController.text);
                                    },
                                    child: new RadioItem2(questiondata3[index]),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    if (status == "Mentee") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MenteeQuizPage2()),
                      );
                    }
                    if (status == "Mentor") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MentorQuizPage2()),
                      );
                    }
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
            ),
          ),
        ),
      ),
    );
  }
}

//DESIGN SPACE

//defines what the first set of radio buttons look like
class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return new Container(
      alignment: Alignment.centerLeft,
      margin: new EdgeInsets.only(right: 22 * widthFactor),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(bottom: 5.0 * heightFactor),
            child: new Text(_item.text,
                style: TextStyle(
                    fontSize: 11 * widthFactor,
                    color: const Color(0xff707070))),
          ),
          new Container(
            height: 40.0 * heightFactor,
            width: 40.0 * widthFactor,
            decoration: new BoxDecoration(
              color: _item.isSelected ? Constants.mainblue : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Constants.mainblue : Colors.grey),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(9999.0)),
            ),
          ),
        ],
      ),
    );
  }
}

//defines what the second set of radio buttons look like
class RadioItem2 extends StatelessWidget {
  final RadioModel _item;
  RadioItem2(this._item);
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return new Container(
      alignment: Alignment.centerLeft,
      margin: new EdgeInsets.only(right: 30 * widthFactor),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(bottom: 5.0 * heightFactor),
            child: new Text(_item.text,
                style: TextStyle(
                    fontSize: 11 * widthFactor,
                    color: const Color(0xff707070))),
          ),
          new Container(
            height: 40.0 * widthFactor,
            width: 40.0 * widthFactor,
            decoration: new BoxDecoration(
              color: _item.isSelected ? Constants.mainblue : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Constants.mainblue : Colors.grey),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(9999.0)),
            ),
          ),
        ],
      ),
    );
  }
}

//defines what the third set of radio buttons look like
class RadioItem3 extends StatelessWidget {
  final RadioModel _item;
  RadioItem3(this._item);
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return new Container(
      alignment: Alignment.centerLeft,
      margin: new EdgeInsets.only(
          right: 30 * widthFactor, bottom: 20 * heightFactor),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 30.0 * widthFactor,
            width: 30.0 * widthFactor,
            decoration: new BoxDecoration(
              color: _item.isSelected ? Constants.mainblue : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Constants.mainblue : Colors.grey),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(9999.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10 * widthFactor),
            child: new Text(_item.text,
                style: TextStyle(
                    fontSize: 11 * widthFactor,
                    color: const Color(0xff707070))),
          ),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  final QuestionList _question;
  Question(this._question);
  @override
  Widget build(BuildContext context) {
    double heightFactor =
        (MediaQuery.of(context).size.height / 683.4285714285714);
    double widthFactor =
        (MediaQuery.of(context).size.width / 411.42857142857144);
    return new Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: new Text.rich(
            new TextSpan(
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 17 * widthFactor,
                color: const Color(0xff707070),
              ),
              children: [
                new TextSpan(text: _question.prefix),
                new TextSpan(
                  text: _question.subject,
                  style: new TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;
  final value;

  RadioModel(this.isSelected, this.text, this.value);
}

class QuestionList {
  final String prefix;
  final String subject;
  final String value;
  QuestionList(this.prefix, this.subject, this.value);
}
