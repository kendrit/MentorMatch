import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mentor_match/HomeScreen.dart';
import 'package:mentor_match/menu_frame.dart';
import 'package:mentor_match/models/user_model.dart';
import 'package:mentor_match/screens/splash_screen.dart';
import 'constants.dart';
import 'firebase_notification_handler.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'MentorMatch',
    //   theme: ThemeData(
    //     primaryColor: Colors.white,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: MenuFrame(),
    //);
    return FutureBuilder(
      //Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('error');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MentorMatch',
            theme: ThemeData(
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MenuFrame(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (auth.currentUser != null) {
            print('signed in!');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MentorMatch',
              theme: ThemeData(
                primaryColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: HomeScreen(),
            );
          } else {
            print('not signed in!');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MentorMatch',
              theme: ThemeData(
                primaryColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MenuFrame(),
            );
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('waiting...');
        return SplashScreen();
      },
    );
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handle background service $message');
  dynamic data = message.data['data'];
  FirebaseNotifications.showNotification(data['title'], data['body']);
}
