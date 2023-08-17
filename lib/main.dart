import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Informe seu nome",
              ),
            ),
            SizedBox( // container com tamanho específico (definido abaixo com width)
              width: double.maxFinite, // valor maximo finito; até acabar o container
              child: Padding( // container que permite colocar padding
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cumprimente"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

