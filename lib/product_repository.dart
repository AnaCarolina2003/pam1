import 'package:loja/product.dart';

class ProductRepository {
  static List<Product> list() {
    return <Product>[
      Product.newProduct("Banana", 2.50, 35, 10),
      Product.newProduct("Abacate", 3.50, 30, 10),
      Product.newProduct("Abacaxi", 5.50, 40, 10),
      Product.newProduct("Ameixa", 7.50, 25, 10),
      Product.newProduct("Tomate", 8.50, 15, 10),
    ];
  }
}