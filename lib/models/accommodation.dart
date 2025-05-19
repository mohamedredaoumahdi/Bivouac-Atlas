import 'package:flutter/material.dart';

enum AccommodationType { cabin, tent }

class Accommodation {
  final String title;
  final String description;
  final int price;
  final IconData icon;
  final String availability;
  final AccommodationType type;
  final List<String>? imagePaths; // Changed from single imagePath to multiple imagePaths
  
  // Legacy support for single image path
  String? get imagePath => imagePaths != null && imagePaths!.isNotEmpty ? imagePaths!.first : null;

  const Accommodation({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.availability,
    required this.type,
    this.imagePaths, // Support for multiple images
  });
}