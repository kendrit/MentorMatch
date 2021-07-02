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
}
