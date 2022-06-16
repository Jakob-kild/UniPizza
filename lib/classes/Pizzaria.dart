
class Pizzaria {
  String id, name;
  double rating;

  Pizzaria({
    this.id,
    this.name,
    this.rating
  });

  Map<String, dynamic> toJson() =>{
    'id': id,
    'name': name,
    'rating': rating
  };

  static Pizzaria fromJson(Map<String, dynamic> json) => Pizzaria(
    id: json['id'],
    name: json['name'],
    rating: json['rating']
  );

}