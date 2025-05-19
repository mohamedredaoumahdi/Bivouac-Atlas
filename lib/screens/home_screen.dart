import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_switch.dart';
import 'accommodation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final List<Activity> activities = [
      Activity(
        title: l10n.waterfallHike,
        description: l10n.waterfallHikeDesc,
        icon: Icons.water_drop,
        price: 70,
        imagePath: 'assets/images/activities/waterfall_hike.jpg',
      ),
      Activity(
        title: l10n.tajineCooking,
        description: l10n.tajineCookingDesc,
        icon: Icons.restaurant,
        price: 80,
        imagePath: 'assets/images/activities/tajine_cooking.jpg',
      ),
      Activity(
        title: l10n.villageTour,
        description: l10n.villageTourDesc,
        icon: Icons.location_city,
        price: 25,
        imagePath: 'assets/images/activities/village_tour.jpg',
      ),
      Activity(
        title: l10n.mountainTrekking,
        description: l10n.mountainTrekkingDesc,
        icon: Icons.hiking,
        price: 100,
        imagePath: 'assets/images/activities/mountain_trekking.jpg',
      ),
      Activity(
        title: l10n.lakeExcursion,
        description: l10n.lakeExcursionDesc,
        icon: Icons.water,
        price: 70,
        imagePath: 'assets/images/activities/lake_excursion.jpg',
      ),
      Activity(
        title: l10n.starGazing,
        description: l10n.starGazingDesc,
        icon: Icons.star,
        price: 10,
        imagePath: 'assets/images/activities/star_gazing.jpg',
      ),
      Activity(
        title: l10n.donkeyRide,
        description: l10n.donkeyRideDesc,
        icon: Icons.pets,
        price: 25,
        imagePath: 'assets/images/activities/donkey_ride.jpg',
      ),
      Activity(
        title: l10n.handicraftWorkshop,
        description: l10n.handicraftWorkshopDesc,
        icon: Icons.palette,
        price: 60,
        imagePath: 'assets/images/activities/handicraft_workshop.jpg',
      ),
      Activity(
        title: l10n.forestPicnic,
        description: l10n.forestPicnicDesc,
        icon: Icons.park,
        price: 25,
        imagePath: 'assets/images/activities/forest_picnic.jpg',
      ),
      Activity(
        title: l10n.caveExploration,
        description: l10n.caveExplorationDesc,
        icon: Icons.explore,
        price: 50,
        imagePath: 'assets/images/activities/cave_exploration.jpg',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            actions: const [
              LanguageSwitch(),
              SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(l10n.chooseYourActivity),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF4CAF50), // Natural Green
                      const Color(0xFF2E7D32),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_activity,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.selectYourAdventure,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.availableActivities,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: const Color(0xFF333333), // Dark Charcoal
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.activitiesDescription,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF757575), // Cool Gray
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final activity = activities[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    elevation: 3,
                    child: InkWell(
                      onTap: () => _selectActivity(context, activity, l10n),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Activity Image
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Container(
                                height: 160,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    // Background image with debug logging
                                    if (activity.imagePath != null)
                                      Image.asset(
                                        activity.imagePath!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          // Debug: Print the error to console
                                          print('Failed to load image: ${activity.imagePath}');
                                          print('Error: $error');
                                          return Container(
                                            color: const Color(0xFF4CAF50).withOpacity(0.1),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  activity.icon,
                                                  size: 60,
                                                  color: const Color(0xFF4CAF50),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Image not found',
                                                  style: TextStyle(
                                                    color: const Color(0xFF4CAF50),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  activity.imagePath!.split('/').last,
                                                  style: TextStyle(
                                                    color: const Color(0xFF757575),
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    else
                                      Container(
                                        color: const Color(0xFF4CAF50).withOpacity(0.1),
                                        child: Icon(
                                          activity.icon,
                                          size: 60,
                                          color: const Color(0xFF4CAF50),
                                        ),
                                      ),
                                    // Gradient overlay (only if image would exist)
                                    if (activity.imagePath != null)
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
                                    // Price tag
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF388E3C),
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          '\$${activity.price}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Activity Details
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.title,
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    activity.description,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFF757575),
                                      height: 1.4,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        l10n.tapToSelect,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF4CAF50).withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: const Color(0xFF4CAF50).withOpacity(0.8),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: activities.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
        ],
      ),
    );
  }

  void _selectActivity(BuildContext context, Activity activity, AppLocalizations l10n) {
    // Show confirmation dialog with full description
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                activity.icon,
                color: const Color(0xFF4CAF50),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                l10n.confirmSelection,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Activity Image in Dialog
              if (activity.imagePath != null)
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      activity.imagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Dialog: Failed to load image: ${activity.imagePath}');
                        return Container(
                          color: const Color(0xFF4CAF50).withOpacity(0.1),
                          child: Icon(
                            activity.icon,
                            size: 40,
                            color: const Color(0xFF4CAF50),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              // Activity Title
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                  ),
                  children: [
                    TextSpan(
                      text: '${l10n.selectedActivity}: ',
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: activity.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Activity Price
              Text(
                '${l10n.pricePerPerson}: \$${activity.price}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
              const SizedBox(height: 16),
              // Full Activity Description
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5DC).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF4CAF50).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          size: 16,
                          color: const Color(0xFF4CAF50),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Description',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      activity.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.continueToAccommodation,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              l10n.cancel,
              style: const TextStyle(
                color: Color(0xFF757575),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccommodationScreen(
                    selectedActivity: activity,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF388E3C),
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.continueText),
          ),
        ],
      ),
    );
  }
}