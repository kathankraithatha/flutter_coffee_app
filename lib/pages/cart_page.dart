// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee){
    setState(() {
      Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 20) ,
            ),
            SizedBox(height: 25),
            //list of items
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
                itemBuilder: (context, index) {
              Coffee eachCoffee = value.userCart[index];
              return CoffeeTile(
                  coffee: eachCoffee,
                  onPressed: () => removeFromCart(eachCoffee),
                  icon: Icon(Icons.delete)
              );
            }),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                child: Center(child: Text("Pay Now ${
                    Provider.of<CoffeeShop>(context, listen: false).calculateTotalPrice()} Rs",
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12)),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
