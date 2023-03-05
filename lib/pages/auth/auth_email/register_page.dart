import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../services/auth/auth_service.dart';
import '../../../theme/app_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  static const SizedBox _sizedBox = SizedBox(height: 5);

  _register() async {
    try {
      await context.read<AuthService>().register(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de usuário',
        ),
        backgroundColor: AppTheme.colors.caramel,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: fullNameTextEditingController,
                decoration: const InputDecoration(
                  label: Text(
                    'Nome completo',
                  ),
                ),
              ),
              _sizedBox,
              TextField(
                controller: emailTextEditingController,
                decoration: const InputDecoration(
                  label: Text(
                    'E-mail',
                  ),
                ),
              ),
              _sizedBox,
              TextField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                  label: Text(
                    'Senha',
                  ),
                ),
              ),
              _sizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ElevatedButton(
                      onPressed: () => _register(),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(2),
                        backgroundColor: MaterialStateProperty.all(
                          AppTheme.colors.beige,
                        ),
                      ),
                      child: Text(
                        'Cadastrar usuário',
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
