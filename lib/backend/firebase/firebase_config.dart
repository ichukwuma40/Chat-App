import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAb1gVRRN5RySowt8CgyMiUqqwbdbE_4hM",
            authDomain: "team-chat-app-15fyts.firebaseapp.com",
            projectId: "team-chat-app-15fyts",
            storageBucket: "team-chat-app-15fyts.appspot.com",
            messagingSenderId: "202270238636",
            appId: "1:202270238636:web:71b407eeef4dedd936fc09"));
  } else {
    await Firebase.initializeApp();
  }
}
