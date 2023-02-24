// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class Answer extends StatelessWidget {
  Answer({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;

  final ButtonStyle _buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppTheme.colors.pink,
    ),
  );

  final TextStyle _answerStyle = const TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width * 0.4,
          child: ElevatedButton(
            onPressed: onPressed,
            style: _buttonStyle,
            child: Text(
              text,
              style: _answerStyle,
            ),
          ),
        ),
      ],
    );
  }
}
