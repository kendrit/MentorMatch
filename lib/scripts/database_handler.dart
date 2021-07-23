import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseHandler {
  getUserByFullName(String query) async {
    print("Searching for " + query);
    return FirebaseFirestore.instance
        .collection("users")
        .where("full_name", isEqualTo: query)
        .get();
  }

  createMatch(String matchId, matchMap) {
    FirebaseFirestore.instance
        .collection("matches")
        .doc(matchId)
        .get()
        .then((doc) => {
              if (doc.exists)
                {print("Already Matched")}
              else
                {
                  FirebaseFirestore.instance
                      .collection("matches")
                      .doc(matchId)
                      .set(matchMap)
                      .catchError((e) {
                    print(e.toString());
                  })
                }
            });
  }

  getUserMatches(String user) async {
    return FirebaseFirestore.instance
        .collection("matches")
        .where("users", arrayContains: user)
        .get();
  }

  addMessage(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection("matches")
        .doc(chatRoomId)
        .collection("messages")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
