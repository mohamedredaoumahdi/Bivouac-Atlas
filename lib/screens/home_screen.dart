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
        imagePaths: [
          'assets/images/activities/waterfall_hike_00.jpg',
          'assets/images/activities/waterfall_hike_01.jpg',
          'assets/images/activities/waterfall_hike_02.jpg',
        ],
      ),
      Activity(
        title: l10n.tajineCooking,
        description: l10n.tajineCookingDesc,
        icon: Icons.restaurant,
        price: 80,
        imagePaths: [
          'assets/images/activities/tajine_cooking_00.jpg',
          'assets/images/activities/tajine_cooking_01.jpg',
          'assets/images/activities/tajine_cooking_03.jpg',
        ],
      ),
      Activity(
        title: l10n.villageTour,
        description: l10n.villageTourDesc,
        icon: Icons.location_city,
        price: 25,
        imagePaths: [
          'assets/images/activities/Village_tour_00.jpg',
          'assets/images/activities/Village_tour_01.jpg',
        ],
      ),
      Activity(
        title: l10n.mountainTrekking,
        description: l10n.mountainTrekkingDesc,
        icon: Icons.hiking,
        price: 100,
        imagePaths: [
          'assets/images/activities/mountain_trekking.jpg',
        ],
      ),
      Activity(
        title: l10n.lakeExcursion,
        description: l10n.lakeExcursionDesc,
        icon: Icons.water,
        price: 70,
        imagePaths: [
          'assets/images/activities/Lake_trip_00.jpg',
          'assets/images/activities/Lake_trip_01.jpg',
          'assets/images/activities/Lake_trip_02.jpg',
          'assets/images/activities/Lake_trip_03.jpg',
          'assets/images/activities/Lake_trip_04.jpg',
          'assets/images/activities/Lake_trip_05.jpg',
          'assets/images/activities/Lake_trip_06.jpg',
        ],
      ),
      Activity(
        title: l10n.starGazing,
        description: l10n.starGazingDesc,
        icon: Icons.star,
        price: 10,
        imagePaths: [
          'assets/images/activities/star_gazing.jpg',
        ],
      ),
      Activity(
        title: l10n.donkeyRide,
        description: l10n.donkeyRideDesc,
        icon: Icons.pets,
        price: 25,
        imagePaths: [
          'assets/images/activities/donkey_ride_00.jpg',
          'assets/images/activities/donkey_ride_01.jpg',
        ],
      ),
      Activity(
        title: l10n.handicraftWorkshop,
        description: l10n.handicraftWorkshopDesc,
        icon: Icons.palette,
        price: 60,
        imagePaths: [
          'assets/images/activities/Handicrafts_Workshop_00.jpg',
          'assets/images/activities/Handicrafts_Workshop_01.jpg',
          'assets/images/activities/Handicrafts_Workshop_02.jpg',
          'assets/images/activities/Handicrafts_Workshop_03.jpg',
        ],
      ),
      Activity(
        title: l10n.forestPicnic,
        description: l10n.forestPicnicDesc,
        icon: Icons.park,
        price: 25,
        imagePaths: [
          'assets/images/activities/forest_picnic.jpg',
        ],
      ),
      Activity(
        title: l10n.caveExploration,
        description: l10n.caveExplorationDesc,
        icon: Icons.explore,
        price: 50,
        imagePaths: [
          'assets/images/activities/cave_exploration_01.jpg',
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/heroes/logo.jpg', // Updated path to your logo
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback to icon if logo image is not found
              return Icon(
                Icons.local_activity,
                color: const Color(0xFF4CAF50),
                size: 32,
              );
            },
          ),
        ),
        title: Text(
          l10n.appName,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          LanguageSwitch(),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF4CAF50).withOpacity(0.1),
                    const Color(0xFFF5F5DC).withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF4CAF50).withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.local_activity,
                    size: 50,
                    color: const Color(0xFF4CAF50),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.chooseYourActivity,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.selectYourAdventure,
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Available Activities Section
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
            
            // Activities List
            ...activities.map((activity) => Container(
              margin: const EdgeInsets.only(bottom: 16),
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
                        // Activity Image Carousel
                        if (activity.imagePaths != null && activity.imagePaths!.isNotEmpty)
                          _buildActivityImageCarousel(activity)
                        else
                          _buildActivityPlaceholder(activity),
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
            )).toList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityImageCarousel(Activity activity) {
    final PageController pageController = PageController();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(12),
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: activity.imagePaths!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      activity.imagePaths![index],
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
                                  activity.icon,
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
                                Text(
                                  activity.imagePaths![index].split('/').last,
                                  style: const TextStyle(
                                    color: Color(0xFF757575),
                                    fontSize: 10,
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
            // Image count indicator
            if (activity.imagePaths!.length > 1)
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
                        '${activity.imagePaths!.length}',
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
            if (activity.imagePaths!.length > 1) ...[
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

  Widget _buildActivityPlaceholder(Activity activity) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(12),
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              child: Icon(
                activity.icon,
                size: 60,
                color: const Color(0xFF4CAF50),
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
    );
  }

  void _selectActivity(BuildContext context, Activity activity, AppLocalizations l10n) {
    // Show confirmation dialog with fixed sizing
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dialog Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withOpacity(0.2),
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
              ),
              // Dialog Content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Activity Image Carousel in Dialog
                      if (activity.imagePaths != null && activity.imagePaths!.isNotEmpty)
                        Container(
                          height: 200,
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
                          child: _buildDialogImageCarousel(activity),
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
              ),
              // Dialog Actions
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        l10n.cancel,
                        style: const TextStyle(
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogImageCarousel(Activity activity) {
    final PageController dialogPageController = PageController();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          PageView.builder(
            controller: dialogPageController,
            itemCount: activity.imagePaths!.length,
            itemBuilder: (context, index) {
              return Image.asset(
                activity.imagePaths![index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                    child: Icon(
                      activity.icon,
                      size: 40,
                      color: const Color(0xFF4CAF50),
                    ),
                  );
                },
              );
            },
          ),
          // Image count indicator for dialog
          if (activity.imagePaths!.length > 1)
            Positioned(
              bottom: 8,
              right: 8,
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
                      '${activity.imagePaths!.length}',
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
        ],
      ),
    );
  }
}