import 'package:flutter/material.dart';
import 'package:pedido/home_page.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pedido",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}
