// ignore_for_file: unnecessary_new, prefer_collection_literals

part of 'models.dart';

class Menus {
  late List<Food> food;
  late List<Drink> drink;

  Menus(this.food, this.drink);

  Menus.fromJson(Map<String, dynamic> menu) {
    if (menu['food'] != null) {
      food = <Food>[];
      menu['food'].forEach((v) {
        food.add(new Food.fromJson(v));
      });
    }

    if (menu['drink'] != null) {
      drink = <Drink>[];
      menu['drink'].forEach((v) {
        drink.add(new Drink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food'] = food.map((v) => v.toJson()).toList();
    data['drink'] = drink.map((v) => v.toJson()).toList();
    return data;
  }
}
