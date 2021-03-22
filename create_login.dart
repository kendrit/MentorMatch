import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateLogin extends StatefulWidget {
  const CreateLogin({Key key}) : super(key: key);

  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<CreateLogin> {
  bool _termsAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          //Text(
          //  '',
          //  style: TextStyle(
          //      color: Color.fromRGBO(0, 90, 255, 1.0),
          //      fontSize: 22.0,
          //      fontWeight: FontWeight.w700),
          //  textAlign: TextAlign.left,
          //),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                ),
              ),
              hintText: 'Enter Username',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0).withOpacity(1.0)),
              focusColor: Color.fromRGBO(0, 90, 255, 1.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                ),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(0, 90, 255, 1.0),
              fontSize: 22.0,
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                ),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0).withOpacity(1.0)),
              focusColor: Color.fromRGBO(0, 90, 255, 1.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(54, 125, 255, 1.0),
                ),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(0, 90, 255, 1.0),
              fontSize: 22.0,
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                ),
              ),
              hintText: 'Re-Enter Password',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 1.0).withOpacity(1.0)),
              focusColor: Color.fromRGBO(0, 90, 255, 1.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                ),
              ),
            ),
            style: TextStyle(
              color: Color.fromRGBO(0, 90, 255, 1.0),
              fontSize: 22.0,
            ),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                activeColor: Color.fromRGBO(0, 90, 255, 1.0),
                value: _termsAgreed,
                onChanged: (newValue) {
                  setState(() {
                    _termsAgreed = newValue;
                  });
                },
              ),
              Text(
                'I Agree to the Terms & Conditions',
                style: TextStyle(
                  color: Color.fromRGBO(54, 125, 255, 0.9),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'CANCEL',
                style: TextStyle(
                  color: Color.fromRGBO(0, 90, 255, 1.0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SAVE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            '',
          ),
          Text(
            'Please agree to the Terms & Conditions to continue',
            style:
                TextStyle(color: Color.fromRGBO(0, 90, 255, 0.9), fontSize: 12),
          )
        ],
      ),
    );
  }
}
