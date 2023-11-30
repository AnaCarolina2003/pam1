import 'dart:math';

import 'package:flutter/material.dart';

const _size = 48.0;
// ou const double _size = 48;

class QuantityWidget extends StatefulWidget {
  final int startQuantity;
  final int maxQuantity;
  final VoidCallback onAdd;
  final VoidCallback onSubt;

  const QuantityWidget({
    super.key,
    this.startQuantity = 0,
    required this.maxQuantity,
    required this.onAdd,
    required this.onSubt,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();

    quantity = widget.startQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        button(subt, Icons.remove),
        text(),
        button(add, Icons.add),
      ],
    );
  }

  void add() {
    // setState é usado para atualizar o estado do componente
    // e causar uma atualização na tela
    setState(() {
      quantity = min(quantity + 1, widget.maxQuantity);
      widget.onAdd();
    });
  }

  void subt() {
    setState(() {
      quantity = max(quantity - 1, widget.startQuantity);
      widget.onSubt();
    });
  }

  Widget button(VoidCallback onPressed, IconData icon) {
    final style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.zero,
    );

    return SizedBox(
      width: _size,
      height: _size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Icon(icon),
      ),
    );
  }

  Widget text() => SizedBox(
        height: _size,
        width: _size * 1.5,
        child: Center(
          child: Text(
            "$quantity",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                      color: Colors.purple,
                      blurRadius: 5.0,
                      offset: Offset.zero)
                ]),
          ),
        ),
      );
}
