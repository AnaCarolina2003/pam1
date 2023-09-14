import 'package:flutter/material.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dobro",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final numeroController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: TextField(
                controller: numeroController,
                decoration: const InputDecoration(
                  labelText: "Informe um número",
                ),
              ),
            ),
            ElevatedButton(
                // onPressed: () => dobro(context),
                onPressed: () {
                  dobro(context);
                },
                child: const Text("dobro!")),
          ],
        )));
  }

  void dobro(BuildContext context) {
    final numero = int.parse(numeroController.text);
    final dobro = numero * 2;

    final message = "O dobro de $numero é $dobro";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

void main() => runApp(const Aplicacao());
