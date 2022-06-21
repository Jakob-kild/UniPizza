import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final myController = TextEditingController();

  List<MenuItemDetail> pizzas = MenuItemDetail.menuItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "Pizza Search",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: TextField(
                controller: myController,
                onChanged: searchForKey,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Toppings',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                        ))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pizzas.length,
                itemBuilder: (context, index) {
                  final pizza = pizzas[index];
                  return ListTile(
                    title: Text(
                        "${returnResturauntName(pizza.restaurantId)} - ${pizza.name} : ${pizza.price}kr \n ${pizza.description}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchForKey(String key) {
    final suggestions = MenuItemDetail.menuItems.where((pizza) {
      final desc = pizza.description.toString().toLowerCase();
      final input = key.toLowerCase();
      return desc.contains(input);
    }).toList();
    suggestions.sort((a, b) => a.price.compareTo(b.price));
    setState(() => pizzas = suggestions);
  }

  String returnResturauntName(int id) {
    if (id == 1) {
      return "La Vida";
    } else if (id == 2) {
      return "Il Mondo";
    } else if (id == 3) {
      return "La Sosta";
    } else if (id == 4) {
      return "Alunas";
    } else if (id == 5) {
      return "Saras";
    } else {
      return "Error in ID";
    }
  }
}
