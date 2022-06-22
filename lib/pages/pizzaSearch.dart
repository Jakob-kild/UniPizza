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
    backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
            ),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                itemCount: pizzas.length,
                itemBuilder: (context, index) {
                  final pizza = pizzas[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        title: Text(
                                "${returnResturauntName(pizza.restaurantId)} - ${pizza.name}",
                            style: Theme.of(context).textTheme.headline5) ,
                        subtitle: Text("${pizza.description}",style: Theme.of(context).textTheme.bodyText1),
                        trailing: Row(mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${pizza.price.toInt()} kr',
                                style: Theme.of(context).textTheme.headline5),
                          ],),

                      ),
                      Divider(height: 2,)
                    ],
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
