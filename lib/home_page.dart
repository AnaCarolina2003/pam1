import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:retomada/drawer.dart';

class HomePage extends StatefulWidget { // precisa guardar estado para alterar o texto. tela em si
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { // estado da tela
  
  String word = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: MenuDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Abrir About Page",
            onPressed: (){
              Navigator.pushNamed(context, "/about"); // Navigator.pop -> volta a tela
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Palavra aleatória"),
              Text(word),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int i = Random().nextInt(5000);
                      word = all[i];
                      // word = generateWordPairs().first.asCamelCase; -> retorna 2 palavras (1 palavra composta)
                    });
                  },
                  child: const Text("Gerar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}