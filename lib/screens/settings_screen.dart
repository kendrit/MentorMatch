import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../menu_frame.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class SettingsScreen extends StatelessWidget {
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
            padding: EdgeInsets.symmetric(
                vertical: 0 * heightFactor, horizontal: 0 * widthFactor),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      child: Container(
                        child: Center(
                          child: Text(
                            'LOG OUT',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 27 * widthFactor,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: 200.0 * widthFactor,
                        height: 60.0 * heightFactor,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(41.0),
                          color: Constants.maingreen,
                          border: Border.all(
                              width: 1.0, color: const Color(0xffffffff)),
                        ),
                      ),
                      onTap: () async {
                        await auth.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MenuFrame()),
                        );
                      }),
                ],
              ),
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
