import 'dart:convert';

RestaurantList restaurantListFromJson(String str) => RestaurantList.fromJson(json.decode(str));

String restaurantListToJson(RestaurantList data) => json.encode(data.toJson());

class RestaurantList {
  RestaurantList({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantListInfo> restaurants;

  factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<RestaurantListInfo>.from(json["restaurants"].map((x) => RestaurantListInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class RestaurantListInfo {
  RestaurantListInfo({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory RestaurantListInfo.fromJson(Map<String, dynamic> json) => RestaurantListInfo(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}
