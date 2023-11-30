import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Product {
  // _Product -> private class
  final String id;
  final String name;
  final double price;
  final double revenue;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.revenue,
    required this.stock,
  });

  factory Product.newProduct(
      String name, double price, double revenue, int stock) {
    return Product(
        id: _uuid.v4(),
        name: name,
        price: price,
        revenue: revenue,
        stock: stock);
  }

  double get salePrice => price * (1 + revenue / 100);
  String get salePriceFormatted => _formatter.format(salePrice);
}

final _formatter = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);
