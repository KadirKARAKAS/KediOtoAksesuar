import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:kedi_oto_app/firebase_options.dart';
import 'package:kedi_oto_app/HomePage/Page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await handleAppStart();
}

Future<void> handleAppStart() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Eğer kullanıcı oturum açmamışsa, anonim olarak oturum aç.
  if (auth.currentUser == null) {
    await FirebaseAuth.instance.signInAnonymously();

    Map<String, dynamic> mapSaveData = {};

    if (Platform.isIOS) {
      mapSaveData = {'Platform': 'iOS'};
    } else {
      mapSaveData = {'Platform': 'Android'};
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
        .set(mapSaveData);

    userID = auth.currentUser!.uid;

    runApp(const MaterialApp(
      home: HomePage(),
    ));
  } else {
    userID = auth.currentUser!.uid;

    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
        .collection("Products");

    final querySnapshot = await userRef.get();
    getdataList.clear();

    querySnapshot.docs.forEach((doc) {
      docIDList.add(doc.id);
      getdataList.add(doc.data());
    });

    // Eğer veri listesi boşsa ana uygulama arayüzünü başlat.
    if (getdataList.isEmpty) {
      print("LİSTE BOŞŞşŞ");
      runApp(const MaterialApp(
        home: HomePage(),
      ));
    } else {
      // Eğer veri listesi doluysa ana uygulama arayüzünü başlat.
      print("LİSTE DOLUUUĞ");

      runApp(const MaterialApp(
        home: HomePage(),
      ));
    }
  }
}
