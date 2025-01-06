import 'package:flutter/material.dart';
import 'dart:math'; // For random number generation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodOrderScreen(),
    );
  }
}

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen({Key? key}) : super(key: key);

  @override
  _FoodOrderScreenState createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  final List<Dish> dishes = [
    Dish(
        name: "Pizza", price: 120, ingredients: ["Cheese", "Tomato", "Pepper"]),
    Dish(
        name: "Burger", price: 150, ingredients: ["Beef", "Lettuce", "Cheese"]),
    Dish(name: "Sushi", price: 200, ingredients: ["Rice", "Fish", "Seaweed"]),
  ];

  void _addRandomMenu() {
    final random = Random();
    // Randomly select one dish
    final selectedDish = dishes[random.nextInt(dishes.length)];

    setState(() {
      // Add the selected dish to the list
      dishes.add(selectedDish);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = dishes.fold(0, (sum, dish) => sum + dish.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 135, 135),
        title: Text("Flutter Demo : Food Order - Total Price: $totalPrice"),
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple[100],
                child: Text(
                  dish.price.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              title: Text("Dish $index is ${dish.name}"),
              subtitle: Text(
                  "This menu ingredients are ${dish.ingredients.join(", ")}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomMenu, // Call the function to add one random dish
        backgroundColor: const Color.fromARGB(255, 225, 255, 176),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Dish {
  final String name;
  final int price;
  final List<String> ingredients;

  Dish({required this.name, required this.price, required this.ingredients});
}
