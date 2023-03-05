import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_application/main.dart';
import 'package:trivia_application/services/auth/auth_service.dart';

import '../pages/auth/login/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.currentUser == null) {
      return const LoginPage();
    } else {
      return const TriviaApp();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
