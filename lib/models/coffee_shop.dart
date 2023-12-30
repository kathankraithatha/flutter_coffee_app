// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  //coffee for sale
  final List<Coffee> _shop=[
    //black coffee
    Coffee(
        name: "Long Black",
        price: "250Rs",
        imagePath: "lib/coffee/coffee1.png"
    ),
    //latte
    Coffee(
        name: "Latte",
        price: "350Rs",
        imagePath: "lib/coffee/coffee2.png"
    ),
    //espresso
    Coffee(
        name: "Espresso",
        price: "450Rs",
        imagePath: "lib/coffee/coffee3.png"
    ),
    //iced coffee
    Coffee(
        name: "Iced Coffee",
        price: "150Rs",
        imagePath: "lib/coffee/coffee4.png"
    ),
  ];

  //user cart
  List <Coffee> _userCart=[];
  //get coffee list
  List<Coffee> get coffeeShop => _shop;
  //get user cart
  List<Coffee> get userCart => _userCart;
  //add coffee
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  //remove coffee
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (Coffee coffee in _userCart) {
      // Extracting numerical value from the price string (assuming it's in the format 'xxxRs')
      String priceString = coffee.price.replaceAll('Rs', '').trim();
      double price = double.tryParse(priceString) ?? 0.0;

      totalPrice += price;
    }

    return totalPrice;
  }
}