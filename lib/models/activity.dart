import 'package:flutter/material.dart';

class Activity {
  final String title;
  final String description;
  final IconData icon;
  final int price;
  final String? imagePath; // Add image path field

  const Activity({
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
    this.imagePath, // Make it optional
  });
}