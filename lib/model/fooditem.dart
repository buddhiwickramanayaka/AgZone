import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Rose",
    hotel: "Kasun Hewage",
    price: 140.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/rose-pot-600w-1104677117.jpg",
  ),
  FoodItem(
    id: 2,
    title: " Bonsai tree",
    hotel: "Nadeesha",
    price: 15000.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/bonsai-will-be-successfully-through-600w-1145446307.jpg",
  ),
  FoodItem(
    id: 3,
    title: " Bonsai ",
    hotel: "Domin",
    price: 13000.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/bonsai-will-be-successfully-through-600w-1133319752.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Bromeliads",
    hotel: "Jayani",
    price: 140.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/closed-red-bromeliad-flower-260nw-380038906.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Bromeliads",
    hotel: "Anula vije",
    price: 50.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/terrarium-style-small-garden-rock-600w-1106604212.jpg",
  ),
  FoodItem(
    id: 6,
    title: "blue Okid",
    hotel: "vinudi",
    price: 50.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/blue-okid-flower-wallpapers-600w-1161721660.jpg",
  ),
  FoodItem(
    id: 7,
    title: "palm trees",
    hotel: "Nadeesha",
    price: 240.00,
    imgUrl:
        "https://image.shutterstock.com/image-illustration/3d-illustration-palm-trees-pot-600w-755768542.jpg",
  ),
  FoodItem(
    id: 8,
    title: "cocoa trees",
    hotel: "Nadeesha",
    price: 150.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/cacao-tree-organic-cocoa-fruit-600w-1155615487.jpg",
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
