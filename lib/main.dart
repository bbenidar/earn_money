import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS || Platform.isIOS) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
        name: 'Taearn Android',
        options: const FirebaseOptions(
          appId: '1:232019036747:android:7c28e708a944f6c1efdbce',
          apiKey: 'AIzaSyA7z5X_gKBYFn7D0fr1P7MnAfTeDR0ZkfI',
          projectId: 'taearn-7d8bc',
          messagingSenderId: '',
        ));
  }

  runApp(const MyApp());
}
