// ignore_for_file: unnecessary_new

part of 'models.dart';


class Restaurant {
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  // late Menus menu;

  Restaurant({
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    // required this.menu,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toString();
    // menu = json['menu'].toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    
    return data;
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final Map<String, dynamic> parsedJson = jsonDecode(json); 
  return Restaurant.fromJson(parsedJson).restaurant;
}   

class RestaurantData {
  late List<Restaurant> restaurant;

  RestaurantData(this.restaurant);

  RestaurantData.fromJson(Map<String, dynamic> json) {
    if(json['restaurant'] != null ) {
      restaurant = <Restaurant>[];
      json['restaurant'].foreach((v) {
        restaurant.add(new Restaurant.fromJson(v));
      });
    }
  }
}
