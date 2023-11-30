import 'package:flutter/material.dart';
import 'package:loja/catalog_view_model.dart';
import 'package:loja/detail_page.dart';
import 'package:loja/home_page.dart';
import 'package:provider/provider.dart';

class Aplication extends StatelessWidget {
  const Aplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatalogViewModel>(
          create: (_) => CatalogViewModel(),
        ),
      ],
      child: MaterialApp(
        title: "Loja",
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/detail": (context) => const DetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}