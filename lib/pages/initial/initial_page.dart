import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../auth/auth_email/register_page.dart';
import '../auth/login/login_page.dart';
import '../home/welcome_page.dart';

class InitialPage extends StatelessWidget {
  final String _registerPageRoute = '/auth/auth_email/register_page';
  final String _loginPageRoute = '/auth/login/login_page';
  final String _homePageRoute = '/home/welcome_page';

  final SizedBox _sizedBox = const SizedBox(height: 10);

  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        _registerPageRoute: (_) => const RegisterPage(),
        _loginPageRoute: (_) => const LoginPage(),
        _homePageRoute: (_) => const WelcomePage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trivia Application',
          ),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              _registerPageRoute,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppTheme.colors.beige,
                            ),
                          ),
                          child: Text(
                            'Criar conta',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.colors.caramel,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              _loginPageRoute,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppTheme.colors.beige,
                            ),
                          ),
                          child: Text(
                            'Fazer login',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.colors.caramel,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text(
                            'Entrar como usuário anônimo',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.colors.caramel,
                            ),
                          ),
                          onTap: () => Navigator.of(context).pushNamed(
                            _homePageRoute,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
