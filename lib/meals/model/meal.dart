import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rate;
  final Color backgroundColor;
  const Meal(
      {required this.id,
      required this.name,
      required this.backgroundColor,
      required this.description,
      required this.imageUrl,
      required this.rate,
      required this.price});

  @override
  List<Object?> get props =>
      [id, name, description, imageUrl, price, backgroundColor];
}

List<Color> foodBackgroundColors = [
  const Color(0xFF8F9779), // Sage Green
  const Color(0xFFFFA07A), // Salmon Pink
  const Color(0xFFFFA500), // Mango Orange
  const Color(0xFFD2691E), // Chocolate Brown
  const Color(0xFF6495ED), // Cornflower Blue
];

const List<Meal> meals = [
  Meal(
      id: '1',
      name: 'Spaghetti',
      backgroundColor: Color(0xFF8F9779),
      description: 'Delicious spaghetti with tomato sauce',
      imageUrl: 'assets/1.png',
      rate: 1,
      price: 12.99),
  Meal(
      id: '2',
      name: 'Chicken Caesar Salad',
      backgroundColor: Color(0xFFFFA07A),
      description: 'Healthy chicken caesar salad with fresh vegetables',
      imageUrl: 'assets/2.png',
      rate: 2,
      price: 9.99),
  Meal(
      id: '3',
      name: 'Margherita Pizza',
      backgroundColor: Color(0xFFFFA500), // Mango Orange

      description: 'Classic margherita pizza with mozzarella and tomatoes',
      imageUrl: 'assets/3.png',
      rate: 5,
      price: 14.99),
  Meal(
      id: '4',
      name: 'Grilled Salmon',
      backgroundColor: Color(0xFFD2691E), // Cho
      description: 'Grilled salmon with lemon and herbs',
      imageUrl: 'assets/4.png',
      rate: 4,
      price: 17.99),
  Meal(
      id: '5',
      name: 'Vegetarian Wrap',
      backgroundColor: Color(0xFF6495ED), // Cornfl
      description: 'Tasty vegetarian wrap with assorted vegetables',
      imageUrl: 'assets/5.png',
      rate: 5,
      price: 8.99),
  Meal(
      id: '6',
      name: 'Beef Stir-Fry',
      backgroundColor: Colors.orange,
      description: 'Savory beef stir-fry with mixed vegetables',
      imageUrl: 'assets/1.png',
      rate: 5,
      price: 15.99),
  Meal(
      id: '7',
      name: 'Shrimp Scampi',
      backgroundColor: Color(0xFFFFA07A),
      description: 'Delightful shrimp scampi with garlic and butter sauce',
      imageUrl: 'assets/2.png',
      rate: 1,
      price: 16.99),
  Meal(
      id: '8',
      name: 'Fruit Smoothie',
      backgroundColor: Color(0xFFFFA500), // Mango Orange

      description: 'Refreshing fruit smoothie with a blend of fresh fruits',
      imageUrl: 'assets/3.png',
      rate: 2,
      price: 6.99),
  Meal(
      id: '9',
      name: 'BBQ Ribs',
      backgroundColor: Color(0xFFD2691E), // Cho
      description: 'Succulent BBQ ribs with barbecue sauce',
      imageUrl: 'assets/4.png',
      rate: 3,
      price: 19.99),
  Meal(
      id: '10',
      name: 'Caprese Salad',
      backgroundColor: Color(0xFF6495ED), // Cornfl
      description: 'Caprese salad with tomatoes, mozzarella, and basil',
      imageUrl: 'assets/5.png',
      rate: 3,
      price: 10.99),
];
