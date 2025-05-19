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
      // Updated Cabins
      Accommodation(
        title: 'Atlas Serenity Cabin',
        description: 'A stylish cabin ideal for couples or solo travelers seeking comfort and tranquility amidst the natural beauty of Ait Bouguemez. Features a luxurious double bed, air conditioning, small dining table, TV, Wi-Fi, complimentary breakfast, and panoramic views of the surrounding mountains and fields.',
        price: 40,
        icon: Icons.landscape,
        availability: '2 ${l10n.available}',
        type: AccommodationType.cabin,
        imagePaths: [
          'assets/images/cabins/Atlas_Serenity_Cabin_00.jpg',
          'assets/images/cabins/Atlas_Serenity_Cabin_01.jpg',
          'assets/images/cabins/Atlas_Serenity_Cabin_02.jpg',
        ],
      ),
      Accommodation(
        title: 'Mountain Breeze Lodge',
        description: 'Ideal for families or friends seeking a group retreat in the heart of unspoiled nature. Includes 3 comfortable beds, air conditioning, dining table, TV, internet, complimentary breakfast, and stunning views of the Ait Bouguemez valleys.',
        price: 50,
        icon: Icons.family_restroom,
        availability: '2 ${l10n.available}',
        type: AccommodationType.cabin,
        imagePaths: [
          'assets/images/cabins/Mountain_Breeze_Lodge_00.jpg',
          'assets/images/cabins/Mountain_Breeze_Lodge_01.jpg',
          'assets/images/cabins/Mountain_Breeze_Lodge_02.jpg',
        ],
      ),
      // Updated Tents
      Accommodation(
        title: 'Berber Dream Tent',
        description: 'A traditional tent with a design inspired by Berber heritage, offering you the warmth of Moroccan hospitality in a unique natural setting. Includes a large double bed, small table, stunning view of the Ait Bouguemez Mountains, and complimentary breakfast.',
        price: 25,
        icon: Icons.temple_buddhist,
        availability: '5 ${l10n.available}',
        type: AccommodationType.tent,
        imagePaths: [
          'assets/images/tents/Berber_Dream_Tent_00.jpg',
          'assets/images/tents/Berber_Dream_Tent_01.jpg',
          'assets/images/tents/Berber_Dream_Tent_02.jpg',
          'assets/images/tents/Berber_Dream_Tent_03.jpg',
          'assets/images/tents/Berber_Dream_Tent_04.jpg',
        ],
      ),
      Accommodation(
        title: 'Atlas Family Tent',
        description: 'Ideal for groups or families seeking a comfortable and authentic camping experience. Includes 3 beds, small table, view of the Atlas Mountains, and complimentary breakfast.',
        price: 35,
        icon: Icons.night_shelter,
        availability: '5 ${l10n.available}',
        type: AccommodationType.tent,
        imagePaths: [
          'assets/images/tents/Atlas_Family_Tent_00.jpg',
          'assets/images/tents/Atlas_Family_Tent_01.jpg',
          'assets/images/tents/Atlas_Family_Tent_02.jpg',
          'assets/images/tents/Atlas_Family_Tent_03.jpg',
          'assets/images/tents/Atlas_Family_Tent_04.jpg',
        ],
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
            // Selected Activity Summary with Image
            Card(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: widget.selectedActivity.imagePath != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                widget.selectedActivity.imagePath!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                                    child: Icon(
                                      widget.selectedActivity.icon,
                                      color: const Color(0xFF4CAF50),
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              color: const Color(0xFF4CAF50).withOpacity(0.1),
                              child: Icon(
                                widget.selectedActivity.icon,
                                color: const Color(0xFF4CAF50),
                                size: 24,
                              ),
                            ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Accommodation Image Carousel
              if (accommodation.imagePaths != null && accommodation.imagePaths!.isNotEmpty)
                _buildImageCarousel(accommodation, l10n),
              // Accommodation Details
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFF4CAF50).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            accommodation.icon,
                            color: isSelected ? Colors.white : const Color(0xFF4CAF50),
                            size: 24,
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
                              if (accommodation.imagePaths == null || accommodation.imagePaths!.isEmpty)
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
                        if (accommodation.imagePaths == null || accommodation.imagePaths!.isEmpty)
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(Accommodation accommodation, AppLocalizations l10n) {
    final PageController pageController = PageController();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(12),
      ),
      child: Container(
        height: 240,
        width: double.infinity,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: accommodation.imagePaths!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      accommodation.imagePaths![index],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF4CAF50).withOpacity(0.1),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  accommodation.icon,
                                  size: 60,
                                  color: const Color(0xFF4CAF50),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Image ${index + 1} not found',
                                  style: const TextStyle(
                                    color: Color(0xFF4CAF50),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Gradient overlay for better text readability
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Price tag overlay
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF388E3C),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$${accommodation.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '/${l10n.perNight}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Availability tag
            Positioned(
              bottom: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  accommodation.availability,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ),
            // Image indicators (dots)
            if (accommodation.imagePaths!.length > 1)
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.photo_camera,
                        size: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${accommodation.imagePaths!.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Swipe indicators (left and right arrows)
            if (accommodation.imagePaths!.length > 1) ...[
              Positioned(
                left: 12,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}