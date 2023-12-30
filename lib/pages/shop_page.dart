// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add To Cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Successfully added to the cart 🥳🥳 "),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "How Would You Like Your Coffee?",
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) ,
            ),
            SizedBox(height: 25),

            //List of coffee's
            Expanded(
              child: ListView.builder(
                itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index){
                Coffee eachCoffee= value.coffeeShop[index];
                return CoffeeTile(
                  coffee: eachCoffee,
                  onPressed: () => addToCart(eachCoffee) ,
                  icon: Icon(Icons.add),
                );

              }
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
