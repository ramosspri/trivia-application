import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_application/pages/initial/initial_page.dart';
import 'package:trivia_application/theme/app_theme.dart';

import 'services/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      child: const TriviaApp(),
    ),
  );
}

class TriviaAppState extends State<TriviaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppTheme.colors.caramel,
      ),
      debugShowCheckedModeBanner: false,
      home: const InitialPage(),
    );
  }
}

class TriviaApp extends StatefulWidget {
  const TriviaApp({super.key});

  @override
  TriviaAppState createState() {
    return TriviaAppState();
  }
}
