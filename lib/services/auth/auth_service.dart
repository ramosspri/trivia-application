// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trivia_application/core/messages/error_messages.dart';

class AuthException implements Exception {
  String message;
  AuthException({
    required this.message,
  });
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen(
      (User? user) {
        currentUser = (user == null) ? null : user;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  _getUser() {
    currentUser = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week_password') {
        throw AuthException(
          message: ErrorMessages.weekPassword,
        );
      } else if (e.code == 'email_already_in_use') {
        throw AuthException(
          message: ErrorMessages.emailAlreadyInUse,
        );
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user_not_found') {
        throw AuthException(
          message: ErrorMessages.userNotFound,
        );
      } else if (e.code == 'wrong_password') {
        throw AuthException(
          message: ErrorMessages.wrongPassword,
        );
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
