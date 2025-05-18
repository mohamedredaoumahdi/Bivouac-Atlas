import 'package:bivouac_atlas/l10n/app_localizations.dart';
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
  
  // Move accommodations list here as a late variable
  late List<Accommodation> accommodations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Initialize accommodations here where we have access to l10n
    final l10n = AppLocalizations.of(context)!;
    
    accommodations = [
      // Cabins
      Accommodation(
        title: l10n.panoramicCabin,
        description: l10n.panoramicCabinDesc,
        price: 40,
        icon: Icons.landscape,
        availability: '2 ${l10n.available}',
        type: AccommodationType.cabin,
      ),
      Accommodation(
        title: l10n.familyCabin,
        description: l10n.familyCabinDesc,
        price: 35,
        icon: Icons.family_restroom,
        availability: '2 ${l10n.available}',
        type: AccommodationType.cabin,
      ),
      Accommodation(
        title: l10n.ecoNatureCabin,
        description: l10n.ecoNatureCabinDesc,
        price: 30,
        icon: Icons.eco,
        availability: '2 ${l10n.available}',
        type: AccommodationType.cabin,
      ),
      // Tents
      Accommodation(
        title: l10n.traditionalBerberTent,
        description: l10n.traditionalBerberTentDesc,
        price: 15,
        icon: Icons.temple_buddhist,
        availability: '6 ${l10n.available}',
        type: AccommodationType.tent,
      ),
      Accommodation(
        title: l10n.comfortTent,
        description: l10n.comfortTentDesc,
        price: 20,
        icon: Icons.night_shelter,
        availability: '4 ${l10n.available}',
        type: AccommodationType.tent,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final cabins = accommodations.where((a) => a.type == AccommodationType.cabin).toList();
    final tents = accommodations.where((a) => a.type == AccommodationType.tent).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chooseAccommodation),
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
                          Text(
                            '${l10n.selectedActivity}:',
                            style: const TextStyle(
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
            Text(
              l10n.cabins,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            ...cabins.map((accommodation) => _buildAccommodationCard(accommodation, l10n)),
            
            const SizedBox(height: 32),
            
            // Tents Section
            Text(
              l10n.tents,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            ...tents.map((accommodation) => _buildAccommodationCard(accommodation, l10n)),
            
            const SizedBox(height: 24),
            
            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Color(0xFF4CAF50),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.accommodationNotice,
                      style: const TextStyle(
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
                    '${l10n.continueWith} ${selectedAccommodation!.title}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccommodationCard(Accommodation accommodation, AppLocalizations l10n) {
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
                        Text(
                          l10n.perNight,
                          style: const TextStyle(
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
                    child: Text(
                      l10n.selected,
                      style: const TextStyle(
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