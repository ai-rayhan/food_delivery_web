import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_demo/utils/showOTPDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:food_delivery_web/components/snackbar.dart';
import 'package:food_delivery_web/screens/auth_screen.dart';
import 'package:food_delivery_web/screens/home_screen.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  final firestoreInstance = FirebaseFirestore.instance;

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String fullname,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userDocRef =
          firestoreInstance.collection('currentloggedinuser').doc(user.uid);

      final userData = {
        'admin': false,
        'name': fullname,
        'email': email,
        'cart': [],
        'order': [],
        'history': [],
      };
      await userDocRef.set(userData);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushNamed(context, HomeScreen.routename);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthScreen()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
}
