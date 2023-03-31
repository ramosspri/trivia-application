import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trivia_application/services/auth/auth_service.dart';

import '../../../theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  late bool isLogin = true;

  @override
  void initState() {
    super.initState;
  }

  _login() async {
    try {
      await context.read<AuthService>().login(
            emailTextEditingController.text,
            passwordTextEditingController.text,
          );
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox sizedBox = SizedBox(height: 5);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailTextEditingController,
                decoration: const InputDecoration(
                  label: Text(
                    'E-mail',
                  ),
                ),
              ),
              sizedBox,
              TextField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                  label: Text(
                    'Senha',
                  ),
                ),
              ),
              sizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ElevatedButton(
                      onPressed: () => _login(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppTheme.colors.beige,
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colors.caramel,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
