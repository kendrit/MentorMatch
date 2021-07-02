import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/constants.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'quiz_page1.dart';
import 'QuizEnd.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

Future<void> _addUser(String label, String value) async {
  String fullname = '$firstname $lastname';
  CollectionReference userdata =
      FirebaseFirestore.instance.collection('userdata');
  userdata.doc(auth.currentUser.uid).update({label: value}).catchError(
      (error) => userdata.doc(auth.currentUser.uid).set({label: value}));
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> questiondata1 = new List<RadioModel>();
  List<RadioModel> questiondata2 = new List<RadioModel>();
  List<RadioModel> questiondata3 = new List<RadioModel>();
  List<QuestionList> question = new List<QuestionList>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questiondata1.add(new RadioModel(false, 'Very Unlikely', "1"));
    questiondata1.add(new RadioModel(false, 'Unlikely', "2"));
    questiondata1.add(new RadioModel(false, 'Not Sure', "3"));
    questiondata1.add(new RadioModel(false, 'Likely', "4"));
    questiondata1.add(new RadioModel(false, 'Very Likely', "5"));
    questiondata2.add(new RadioModel(false, '0-1', "1"));
    questiondata2.add(new RadioModel(false, '2', "2"));
    questiondata2.add(new RadioModel(false, '3', "3"));
    questiondata2.add(new RadioModel(false, '4', "4"));
    questiondata2.add(new RadioModel(false, '5+', "5"));
    questiondata3.add(new RadioModel(false, 'Aerospace Engineering', 'AERO'));
    questiondata3.add(new RadioModel(false, 'Bioengineering', 'BIO'));
    questiondata3.add(new RadioModel(false, 'Civil Engineering', 'CIVIL'));
    questiondata3.add(new RadioModel(false, 'Computer Engineering', 'CE'));
    questiondata3.add(new RadioModel(false, 'Computer Science', 'CS'));
    questiondata3.add(new RadioModel(false, 'Electrical Engineering', 'EE'));
    questiondata3.add(new RadioModel(false, 'Engineering Mechanics', 'EM'));
    questiondata3.add(new RadioModel(false, 'Physics', 'PHYS'));
    questiondata3.add(new RadioModel(false, 'Industrial Engineering', 'IE'));
    questiondata3.add(new RadioModel(false, 'Mechanical Engineering', 'ME'));
    questiondata3
        .add(new RadioModel(false, 'Systems Engineering and Design', 'SYS'));
    question.add(
        new QuestionList('How likely are you to', ' be a leader?', 'leader'));
    question.add(new QuestionList(
        'How many STEM courses', ' have you taken?', 'stemtaken'));
    question.add(new QuestionList('What is your', ' planned major?', 'major'));
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
                                      _addUser(question[0].value,
                                          questiondata1[index].value);
                                      print(questiondata1);
                                    });
                                  },
                                  child: new RadioItem(questiondata1[index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    new Question(question[1]),
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
                                      _addUser(question[1].value,
                                          questiondata2[index].value);
                                    });
                                  },
                                  child: new RadioItem2(questiondata2[index]),
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
                      height: 190 * heightFactor,
                      child: new ListView.builder(
                        scrollDirection: Axis.vertical,
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
                                    _addUser(question[2].value,
                                        questiondata3[index].value);
                                  },
                                  child: new RadioItem3(questiondata3[index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
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
