// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'theme/app_theme.dart';

class Cep extends StatelessWidget {
  const Cep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CEP',
        ),
        backgroundColor: AppTheme.colors.lightPink,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

void main() async {
  final result =
      await get(Uri.parse('https://viacep.com.br/ws/01001000/json/'));

  if (result.statusCode != 200) {
    BotToast.showText(text: 'Erro ao buscar CEP.');
    return;
  }

  final resultData = json.decode(result.body);
  print(resultData);
}
