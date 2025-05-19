import 'package:flutter/material.dart';

enum AccommodationType { cabin, tent }

class Accommodation {
  final String title;
  final String description;
  final int price;
  final IconData icon;
  final String availability;
  final AccommodationType type;
  final String? imagePath; // Add image path field

  const Accommodation({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.availability,
    required this.type,
    this.imagePath, // Make it optional
  });
}