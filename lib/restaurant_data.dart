import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String desc;
  String pictureId;
  String city;
  double rating;

  Restaurant({
    this.id,
    this.name,
    this.desc,
    this.pictureId,
    this.city,
    this.rating
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    desc = json["description"];
    pictureId = json["pictureId"];
    city = json["city"];
    rating = json["rating"].toDouble();
  }
}

List<Restaurant> parseRestaurant(String json) {
  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}