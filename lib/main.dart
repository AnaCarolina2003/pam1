import 'dart:math';

import 'package:flutter/material.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Maior",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final numero1Controller = TextEditingController();
  final numero2Controller = TextEditingController();
  
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              newTextField(numero1Controller, "Número 1"),
              newTextField(numero2Controller, "Número 2"),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => maior(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.beach_access_rounded, color: Colors.blue),
                      Text("Maior"),
                      Icon(Icons.beach_access_rounded, color: Colors.blue),
                    ],
                  ) 
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void maior(BuildContext context) {
    final num1 = int.parse(numero1Controller.text);
    final num2 = int.parse(numero2Controller.text);

    final resultado = max(num1, num2);

    // int resultado;

    // switch (num1 > num2) {
    //   case true:
    //     resultado = num1;
    //     break;
    //   default:
    //     resultado = num2;
    //     break;
    // }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("O maior número é: $resultado")),
    );
  } 

  Widget newTextField(TextEditingController controller, String text) {
    return TextField( 
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        icon: const Icon(Icons.surfing),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

void main() => runApp(const Aplicacao());