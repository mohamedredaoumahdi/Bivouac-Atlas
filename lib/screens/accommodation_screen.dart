import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../models/accommodation.dart';
import 'booking_screen.dart';

class AccommodationScreen extends StatefulWidget {
  final Activity selectedActivity;

  const AccommodationScreen({
    super.key,
    required this.selectedActivity,
  });

  @override
  State<AccommodationScreen> createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  Accommodation? selectedAccommodation;

  final List<Accommodation> accommodations = [
    Accommodation(
      title: 'Panoramic Cabin',
      description: 'Located on a quiet hill, offering a stunning panoramic view of the mountains and valleys. Ideal for couples and those seeking tranquility.',
      price: 40,
      icon: Icons.landscape,
      availability: '2 available',
      type: AccommodationType.cabin,
    ),
    Accommodation(
      title: 'Family Cabin',
      description: 'Designed for families or groups, equipped with multiple beds and a comfortable seating area.',
      price: 35,
      icon: Icons.family_restroom,
      availability: '2 available',
      type: AccommodationType.cabin,
    ),
    Accommodation(
      title: 'Eco-Nature Cabin',
      description: 'Wooden cabins blending with nature, made from eco-friendly local materials, with a warm, traditional design.',
      price: 30,
      icon: Icons.eco,
      availability: '2 available',
      type: AccommodationType.cabin,
    ),
    Accommodation(
      title: 'Traditional Berber Tent',
      description: 'Inspired by Amazigh tents, featuring local furnishings and an authentic traditional atmosphere.',
      price: 15,
      icon: Icons.temple_buddhist,
      availability: '6 available',
      type: AccommodationType.tent,
    ),
    Accommodation(
      title: 'Comfort Tent',
      description: 'Equipped with comfortable pillows and more space, with curtains and light insulation for comfort.',
      price: 20,
      icon: Icons.night_shelter,
      availability: '4 available',
      type: AccommodationType.tent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cabins = accommodations.where((a) => a.type == AccommodationType.cabin).toList();
    final tents = accommodations.where((a) => a.type == AccommodationType.tent).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Accommodation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selected Activity Summary
            Card(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      widget.selectedActivity.icon,
                      color: const Color(0xFF4CAF50),
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selected Activity:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            widget.selectedActivity.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${widget.selectedActivity.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Cabins Section
            const Text(
              'Cabins',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            ...cabins.map((accommodation) => _buildAccommodationCard(accommodation)),
            
            const SizedBox(height: 32),
            
            // Tents Section
            const Text(
              'Tents',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            ...tents.map((accommodation) => _buildAccommodationCard(accommodation)),
            
            const SizedBox(height: 24),
            
            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF4CAF50),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'All accommodations include a fresh local breakfast.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Continue Button
            if (selectedAccommodation != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(
                        selectedActivity: widget.selectedActivity,
                        selectedAccommodation: selectedAccommodation!,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Continue with ${selectedAccommodation!.title}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccommodationCard(Accommodation accommodation) {
    final isSelected = selectedAccommodation == accommodation;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: isSelected ? 6 : 2,
      child: InkWell(
        onTap: () => setState(() => selectedAccommodation = accommodation),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: const Color(0xFF4CAF50), width: 2)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFF4CAF50).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        accommodation.icon,
                        color: isSelected ? Colors.white : const Color(0xFF4CAF50),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            accommodation.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          Text(
                            accommodation.availability,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${accommodation.price}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFF333333),
                          ),
                        ),
                        const Text(
                          'per night',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF4CAF50),
                        size: 24,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  accommodation.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Selected',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}