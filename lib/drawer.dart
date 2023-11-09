import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: Text("Meu menu"),
        ),
        createListTile("Item 1"),
        createListTile("Item 2"),
      ],
    );
  }

  Widget createListTile(String texto) {
    return ListTile(
      onTap: (){},
      title: Text(texto),
    );
  }
}