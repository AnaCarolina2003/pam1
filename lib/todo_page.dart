import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'dart:developer';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    "ModalRoute.of(context)?.settings.arguments as Todo;

    ModalRoute.of(context) => 
    recupera o objeto de navegação
    (contendo origem e destino) para chegar até essa tela (caso haja)

    ModalRoute.of(context)?.settings => 
    depois pega as configurações da rota

    ModalRoute.of(context)?.settings.arguments => 
    recupera arguments passado na rota
    
    ModalRoute.of(context)?.settings.arguments as Todo => 
    converte para "Todo"
    */
    final todo = ModalRoute.of(context)?.settings.arguments as Todo;
    // "?" para verificar se o usuário vem da tela principal; código recupera a rota que usou para chegar natela

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title: ${todo.title}"),
            Text("Responsável: ${todo.responsible}"),
            Text("Vencimento: ${todo.dueDate}"),
            Text("Status: ${todo.status}"),
          ],
        ),
      ),
    );
  }
}
