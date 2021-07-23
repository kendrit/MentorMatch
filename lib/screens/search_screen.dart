import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match/HomeScreen.dart';
import 'package:mentor_match/constants.dart';
import 'package:mentor_match/scripts/database_handler.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseHandler databaseHandler = new DatabaseHandler();
  TextEditingController searchtext = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initSearch() {
    databaseHandler.getUserByFullName(searchtext.text).then((x) {
      setState(() {
        searchSnapshot = x;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchRow(
                  userName: searchSnapshot.docs[index].data()["full_name"],
                  userEmail: searchSnapshot.docs[index].data()["email"],
                  requestedUserId: searchSnapshot.docs[index].id);
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 8,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          )),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                color: Constants.mainblue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchtext,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Search Name...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Constants.mainblue,
                            Constants.maingreen
                          ])),
                          child: Image.asset("assets/images/search.png")),
                      onTap: () {
                        initSearch();
                      }),
                ])),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchRow extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String requestedUserId;
  createMatch(String matcheduserid) {
    if (getUsers("status") == "Mentor") {
      List<String> _users = [auth.currentUser.uid, matcheduserid];
      String matchId = _users[0].toString() + "_" + _users[1].toString();
      print(matchId);
      Map<String, dynamic> matchMap = {
        "users": _users,
        "matchId": matchId,
        "time": DateTime.now(),
      };
      DatabaseHandler().createMatch(matchId, matchMap);
    } else {
      List<String> _users = [matcheduserid, auth.currentUser.uid];
      String matchId = _users[0].toString() + "_" + _users[1].toString();
      print(matchId);
      Map<String, dynamic> matchMap = {
        "users": _users,
        "matchId": matchId,
        "time": DateTime.now(),
      };
      DatabaseHandler().createMatch(matchId, matchMap);
    }
    //Navigator.push(context, MaterialPageRoute(
    //builder: (context) => ChatScreen()))
  }

  SearchRow({this.userName, this.userEmail, this.requestedUserId});
  @override
  Widget build(BuildContext context) {
    if (DatabaseHandler()
        .doesMatchExist(auth.currentUser.uid, requestedUserId)) {}
  }
}
