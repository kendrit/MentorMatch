import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(60, 60, 60, 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.microsoft,
                color: Color.fromRGBO(54, 125, 255, 1.0),
                size: 30.0,
              ),
              Text(
                ' | Sign in with Microsoft',
                style: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(60, 60, 60, 1.0),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.envelope,
                color: Color.fromRGBO(54, 125, 255, 1.0),
                size: 30.0,
              ),
              Text(
                ' | Sign in with Email',
                style: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(60, 60, 60, 1.0),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Already Registered? Sign In',
          style: TextStyle(
            color: Color.fromRGBO(54, 125, 255, 1.0),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
