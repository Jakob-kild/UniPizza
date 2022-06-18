import 'package:equatable/equatable.dart';

class MenuItemDetail extends Equatable{
  final Map<String, num> pizzaria;
  final int restaurantId;
  final String name;
  final String category;
  final String description;

  MenuItemDetail({this.category,this.pizzaria, this.restaurantId, this.name, this.description});

  @override
  // TODO: implement props
  List<Object> get props => [
    pizzaria,
    category,
    restaurantId,
    name,
    description,];

  static List<MenuItemDetail> menuItems = [
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'Vesuvio',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, ham',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52 },
      name: 'Juventus',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, Onions',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'Pepperoni',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, pepperoni',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'Hawaii',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, pineapple',
    ),
    MenuItemDetail(
      pizzaria: {"Geppetto's Pizza Lyngby": 56 },
      name: 'Mama Mia',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    ),
    MenuItemDetail(
      pizzaria: {"Pizzaria Luca": 50,"Kongens Pizzaria Lyngby": 52,"Geppetto's Pizza Lyngby": 56 },
      name: 'pizza1',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
    )
  ];
}