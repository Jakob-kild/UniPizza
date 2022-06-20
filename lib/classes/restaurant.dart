import 'package:equatable/equatable.dart';
import '../models/menu_item.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItemDetail> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Restaurant(
      {this.id,
      this.imageUrl,
      this.menuItems,
      this.name,
      this.tags,
      this.deliveryTime,
      this.deliveryFee,
      this.distance});

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, imageUrl, name, tags, deliveryTime, deliveryFee, distance];

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        imageUrl:
            'https://cdn-rdb.arla.com/Files/arla-se/3533573795/2f85257c-e8af-47d1-a512-56fa8e4f7794.jpg?crop=(0,362,0,-466)&w=1200&h=630&scale=both&format=jpg&quality=80&ak=f525e733&hm=99187999',
        name: 'La Vida Stenovns Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) =>
                menuItem.pizzaria.keys.contains("Kongens Pizzaria Lyngby"))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 35.5,
        distance: 0.1),
    Restaurant(
        id: 2,
        imageUrl:
            'https://images.aftonbladet-cdn.se/v2/images/905f3eda-fe41-48f9-a5e0-1b285354d9e8?fit=crop&format=auto&h=750&q=50&w=1000&s=8dd4e4aeb8d2673698c87c3a7e875ec0205d408a',
        name: 'Il Mondo Pizzaria',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) =>
                menuItem.pizzaria.keys.contains("Kongens Pizzaria Lyngby"))
            .toList(),
        deliveryTime: 25,
        deliveryFee: 35.5,
        distance: 0.1),
    Restaurant(
        id: 3,
        imageUrl:
            'https://images.aftonbladet-cdn.se/v2/images/905f3eda-fe41-48f9-a5e0-1b285354d9e8?fit=crop&format=auto&h=750&q=50&w=1000&s=8dd4e4aeb8d2673698c87c3a7e875ec0205d408a',
        name: 'La Sosta Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) =>
                menuItem.pizzaria.keys.contains("Kongens Pizzaria Lyngby"))
            .toList(),
        deliveryTime: 25,
        deliveryFee: 35.5,
        distance: 0.1),
    Restaurant(
        id: 4,
        imageUrl:
            'https://images.aftonbladet-cdn.se/v2/images/905f3eda-fe41-48f9-a5e0-1b285354d9e8?fit=crop&format=auto&h=750&q=50&w=1000&s=8dd4e4aeb8d2673698c87c3a7e875ec0205d408a',
        name: 'Alunas Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) =>
                menuItem.pizzaria.keys.contains("Kongens Pizzaria Lyngby"))
            .toList(),
        deliveryTime: 25,
        deliveryFee: 35.5,
        distance: 0.1),
    Restaurant(
        id: 5,
        imageUrl:
            'https://images.aftonbladet-cdn.se/v2/images/905f3eda-fe41-48f9-a5e0-1b285354d9e8?fit=crop&format=auto&h=750&q=50&w=1000&s=8dd4e4aeb8d2673698c87c3a7e875ec0205d408a',
        name: 'Saras Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) =>
                menuItem.pizzaria.keys.contains("Kongens Pizzaria Lyngby"))
            .toList(),
        deliveryTime: 25,
        deliveryFee: 35.5,
        distance: 0.1)
  ];
}
