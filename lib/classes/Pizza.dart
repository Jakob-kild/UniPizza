import '../classes/restaurant.dart';

class Pizza{
  String name;
  num price;
  List<Restaurant> pizzarias;
  List<String> ingredients;

  Pizza({
    this.name,
    this.price,
    this.ingredients,
    this.pizzarias});

  List<Map> Pizzas = [
    {"name": "margarita"},
    {"Navn": "Geppetto's Pizza Lyngby","Rating":"3.7/5"},
    {"Navn": "Kongens Pizza Lyngby","Rating":"3.5/5"}
  ];
}
