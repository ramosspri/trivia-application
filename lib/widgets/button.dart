// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget Function(BuildContext context) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colors.lightPink,
      ),
      child: child,
    );
  }
}
