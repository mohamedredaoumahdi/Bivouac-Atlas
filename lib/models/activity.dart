import 'package:flutter/material.dart';

class Activity {
  final String title;
  final String description;
  final IconData icon;
  final int price;
  final List<String>? imagePaths; // Changed from single imagePath to multiple imagePaths
  
  // Legacy support for single image path
  String? get imagePath => imagePaths != null && imagePaths!.isNotEmpty ? imagePaths!.first : null;

  const Activity({
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
    this.imagePaths, // Support for multiple images
  });
}