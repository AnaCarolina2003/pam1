import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text("Atividade"),
                Text("Avaliativa"),
              ],
            ),
            Column(
              children: const [
                Text("Luís"),
                Text("Ana"),
              ],
            ),
            Column(children: const [
              Text("2H3"),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Agosto "),
                    Text("2023"),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(const Aplicacao());
