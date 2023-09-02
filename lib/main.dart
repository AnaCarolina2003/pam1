import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final produtoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final precoController = TextEditingController();

  final formatador = NumberFormat.currency(
    locale: "pt_BR", // formata para o português
    symbol: "R\$", // formata de BRL para R$ 
  );

  var total = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              newTextField(produtoController, "Produto"),
              newTextField(quantidadeController, "Quantidade"),
              newTextField(precoController, "Preço"),
              SizedBox(
                width: double.maxFinite,
                height: 45,
                child: ElevatedButton(
                  onPressed: calcular, // ou onPressed: () { calcular() } 
                  child: const Text("Calcular"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text("Total: "),
                  ),
                  Text(formatador.format(total)), // campo do total é a var 'total' formatada para a moeda da lingua do pc (ou a escolhida)
                ],
              ),
            ],
          )
        )
      )
    );
  }

 Widget newTextField(TextEditingController controller, String text) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
      labelText: text,
      border: const OutlineInputBorder(),
      ),
    );
 }
  

  void calcular() {
    final quantidade = int.parse(quantidadeController.text);
    final preco = double.parse(precoController.text);

    setState(() { // atualiza estado
      total = quantidade * preco;
    });
  } 
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pedido",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(const Aplicacao());

// ./github.sh