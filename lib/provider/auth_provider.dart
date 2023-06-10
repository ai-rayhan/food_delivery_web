// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/snackbar.dart';
import 'package:food_delivery_web/screens/home_screen.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _init();
  }

  Future<void> _init() async {
    _user = _firebaseAuth.currentUser;
    notifyListeners();
  }

  User? get user => _user;

  bool get isLoggedIn => _user != null;
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;

      final userDocRef =
          firestoreInstance.collection('currentloggedinuser').doc(user!.uid);

      final userData = {
        'admin': false,
        'name': name,
        'email': email,
        'cart': [],
        'order': [],
        'history': [],
      };
      await userDocRef.set(userData);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);

      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => SnackBar(
                content: Text(e.toString()),
              ));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }
}
