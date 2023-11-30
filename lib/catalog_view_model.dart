// catalog dentro do contexto compartilhado
import 'package:flutter/foundation.dart';
import 'package:loja/product.dart';
import 'package:loja/product_repository.dart';

class CatalogViewModel extends ChangeNotifier {
  
  late List<Product> _products;

  CatalogViewModel(){
    _products = ProductRepository.list();
  }

  List<Product> get products => _products;
}