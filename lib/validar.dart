import 'package:carta_inc/crea.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

// Llamar a initializeFirebase() antes de runApp() en la función main.

void main() {
  initializeFirebase()
      .then((_) {
    runApp(MyApp());
  })
      .catchError((error) {
    print('Error: $error');
  });
}
