import 'package:flutter/material.dart';
import 'package:trivia_application/pages/initial/initial_page.dart';

import '../../theme/app_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppTheme.colors.caramel,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => _logoutRoute(context),
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (_, index) => Divider(
            height: 20,
            color: AppTheme.colors.caramel.withOpacity(0.2),
            indent: 10,
            endIndent: 10,
          ),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (_, index) => ListTile(
            title: Text(
              'Hello, number $index',
              style: TextStyle(
                color: AppTheme.colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppTheme.colors.brown,
                  width: 1.5,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }

  void _logoutRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const InitialPage(),
      ),
    );
  }
}
