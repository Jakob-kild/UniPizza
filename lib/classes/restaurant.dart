import '../models/menu_item.dart';

class Pizzaria {
  final int id, deliveryTime;
  final String imageUrl, name, tlf, streetName;
  final List<String> tags, discounts;
  final List<MenuItemDetail> menuItems;
  final double deliveryFee, distance, rating;

  const Pizzaria(
      {this.id,
      this.imageUrl,
      this.menuItems,
      this.name,
      this.tags,
      this.deliveryTime,
      this.deliveryFee,
      this.distance,
      this.rating,
      this.tlf,
      this.streetName,
      this.discounts});

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        imageUrl,
        name,
        tags,
        deliveryTime,
        deliveryFee,
        distance,
        rating,
        tlf,
        streetName,
        discounts
      ];

  static List<Pizzaria> getSortedResturants() {
    restaurants.sort((b, a) => a.rating.compareTo(b.rating));
    return restaurants;
  }

  static List<Pizzaria> restaurants = [
    Pizzaria(
        id: 1,
        imageUrl:
            'https://cdn-rdb.arla.com/Files/arla-se/3533573795/2f85257c-e8af-47d1-a512-56fa8e4f7794.jpg?crop=(0,362,0,-466)&w=1200&h=630&scale=both&format=jpg&quality=80&ak=f525e733&hm=99187999',
        name: 'La Vida Stenovns Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 40,
        rating: 4.2,
        discounts: ["Gratis levering til hele DTU"],
        distance: 1.42,
        tlf: "+45 30 30 02 63",
        streetName: "Eremitageparken 315, 2800 Lyngby"),
    Pizzaria(
        id: 2,
        imageUrl:
            'https://images.aftonbladet-cdn.se/v2/images/905f3eda-fe41-48f9-a5e0-1b285354d9e8?fit=crop&format=auto&h=750&q=50&w=1000&s=8dd4e4aeb8d2673698c87c3a7e875ec0205d408a',
        name: 'Il Mondo Pizzaria',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 25,
        rating: 3.7,
        discounts: ["Gratis levering til hele DTU"],
        distance: 1.41,
        tlf: "+45 45 88 66 93",
        streetName: "Egegårdsvej 1, 2800 Lyngby"),
    Pizzaria(
        id: 3,
        imageUrl:
            'https://images-ext-2.discordapp.net/external/-6PKK2pJ55OhEDjuz2-lAOhgOuDgI0lYW31vH4U66uI/https/madensverden.dk/wp-content/uploads/2021/06/hjemmelavet-pizza.jpg?width=877&height=585',
        name: 'La Sosta Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 32,
        distance: 0.87,
        rating: 3.9,
        discounts: ["Gratis levering til hele DTU over 100kr"],
        tlf: "+45 45 87 06 16",
        streetName: "Carlshøj 49-51, 2800 Lyngby"),
    Pizzaria(
        id: 4,
        imageUrl:
            'https://images-ext-1.discordapp.net/external/sm8mMn4P4wjHPsfN19MC5eSTWYZPqabkekG9OEKZsqI/https/pixnio.com/free-images/2017/03/27/2017-03-27-13-57-05-725x453.jpg?width=652&height=408',
        name: 'Alunas Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 45,
        distance: 1.04,
        discounts: [
          "Fri levering over 100kr",
          "Gratis 1½ sodavand ved køb over 250kr"
        ],
        rating: 4.9,
        tlf: "+45 45 83 28 00",
        streetName: "Sorgenfrigårdsvej 80B, 2800 Lyngby"),
    Pizzaria(
        id: 5,
        imageUrl:
            'https://images-ext-2.discordapp.net/external/5BK6gTbtDerCvMB-wgnkMPQoUpXPy8tHYqOlhHJEf1U/https/img.mummum.dk/wp-content/uploads/2020/10/pizza-11.jpg?width=762&height=585',
        name: 'Saras Pizza',
        tags: ['Pizza', 'Vegetar', 'Kebab', 'Drinks'],
        menuItems: MenuItemDetail.menuItems
            .where((menuItem) => menuItem.restaurantId == 5)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 25,
        distance: 1.20,
        discounts: ["10% for studerende", "Fri levering over 250kr"],
        rating: 3.6,
        tlf: "+45 45 88 68 11",
        streetName: "Lundtofteparken 67, 2800 Lyngby"),
  ];
}
