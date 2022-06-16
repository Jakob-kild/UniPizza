import 'package:equatable/equatable.dart';

class MenuItem extends Equatable{
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItem({this.category,this.id, this.restaurantId, this.name, this.description, this.price});

  @override
  // TODO: implement props
  List<Object> get props => [id,category,
  restaurantId,
  name,
  description,
  price,];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 1,
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 2,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 2,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 4,
      restaurantId: 1,
      name: 'Baviera',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 5,
      restaurantId: 1,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItem(
      id: 7,
      restaurantId: 2,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItem(
      id: 8,
      restaurantId: 3,
      name: 'Water',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItem(
      id: 9,
      restaurantId: 2,
      name: 'Caesar Salad',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItem(
      id: 10,
      restaurantId: 3,
      name: 'CheeseBurger',
      description: 'A burger with Cheese',
      price: 9.99,
    ),
    MenuItem(
      id: 11,
      restaurantId: 4,
      name: 'Chocolate Cake',
      description: 'A cake with chocolate',
      price: 9.99,
    )
  ];
}