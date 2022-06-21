class Category {
  final String id;
  final String name;
  final String image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  @override
  List<Object> get props => [id, name, image];

  static List<Category> categories = [
    Category(id: '1', name: 'Drinks', image: ''),
    Category(id: '2', name: 'Pizza', image: ''),
    Category(id: '3', name: 'Vegetar', image: ''),
    Category(id: '4', name: 'Kebab', image: ''),
  ];
}
