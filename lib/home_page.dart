import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final produtoController = TextEditingController();
  final precoController = TextEditingController();
  final quantidadeController = TextEditingController();

  static const aVista = "à vista";
  static const aPrazo = "à prazo";

  final formatador = NumberFormat.currency(
      locale: "pt_BR",
      symbol: "R\$",

  );

  final formaPagamentos = [aVista, aPrazo];
  var formaPagamento = aVista;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              newTextFild(produtoController, "Produto"),
              newTextFild(quantidadeController, "Quantidade"),
              newTextFild(precoController, "Preço"),
              SizedBox(
                width: double.maxFinite,
                child: DropdownButton(
                  value: formaPagamento,
                  items: formaPagamentos.map(toDMI).toList(),
                  onChanged: (value) => setState(() {
                    formaPagamento = value!;
                  }),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  onPressed: calcular,
                  child: const Text("Calcular"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calcular(){
    final preco = double.parse(precoController.text);
    final quantidade = int.parse(quantidadeController.text);
    final produto = produtoController.text;

    final total = preco * quantidade;
    var totalComDesconto = total;

    if(formaPagamento == aVista){
      totalComDesconto = total * 0.95;
    }

    String message;

    if(total != totalComDesconto){
      message = "${quantidade}x $produto custam ${formatador.format(totalComDesconto)} (${formatador.format(total)})";
    } else {
      message = "${quantidade}x $produto custam ${formatador.format(total)}";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );


  }

  DropdownMenuItem<String> toDMI(String value) => DropdownMenuItem(
        value: value,
        child: Text(value),
      );

  Widget newTextFild(
    TextEditingController controller,
    String label,
  ) =>
      TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      );
}
