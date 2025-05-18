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
      ),
      Activity(
        title: l10n.tajineCooking,
        description: l10n.tajineCookingDesc,
        icon: Icons.restaurant,
        price: 80,
      ),
      Activity(
        title: l10n.villageTour,
        description: l10n.villageTourDesc,
        icon: Icons.location_city,
        price: 25,
      ),
      Activity(
        title: l10n.mountainTrekking,
        description: l10n.mountainTrekkingDesc,
        icon: Icons.hiking,
        price: 100,
      ),
      Activity(
        title: l10n.lakeExcursion,
        description: l10n.lakeExcursionDesc,
        icon: Icons.water,
        price: 70,
      ),
      Activity(
        title: l10n.starGazing,
        description: l10n.starGazingDesc,
        icon: Icons.star,
        price: 10,
      ),
      Activity(
        title: l10n.donkeyRide,
        description: l10n.donkeyRideDesc,
        icon: Icons.pets,
        price: 25,
      ),
      Activity(
        title: l10n.handicraftWorkshop,
        description: l10n.handicraftWorkshopDesc,
        icon: Icons.palette,
        price: 60,
      ),
      Activity(
        title: l10n.forestPicnic,
        description: l10n.forestPicnicDesc,
        icon: Icons.park,
        price: 25,
      ),
      Activity(
        title: l10n.caveExploration,
        description: l10n.caveExplorationDesc,
        icon: Icons.explore,
        price: 50,
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
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              const Color(0xFFF5F5DC).withOpacity(0.3), // Warm Beige
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4CAF50).withOpacity(0.1), // Natural Green
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFF4CAF50).withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  activity.icon,
                                  color: const Color(0xFF4CAF50), // Natural Green
                                  size: 35,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            activity.title,
                                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              color: const Color(0xFF333333), // Dark Charcoal
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF388E3C), // Forest Green
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xFF388E3C).withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            '\$${activity.price}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      activity.description,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: const Color(0xFF757575), // Cool Gray
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
                                            color: const Color(0xFF4CAF50).withOpacity(0.8), // Natural Green
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: const Color(0xFF4CAF50).withOpacity(0.8), // Natural Green
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
    // Show confirmation dialog
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
                color: const Color(0xFF4CAF50).withOpacity(0.1), // Natural Green
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                activity.icon,
                color: const Color(0xFF4CAF50), // Natural Green
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                l10n.confirmSelection,
                style: const TextStyle(
                  color: Color(0xFF333333), // Dark Charcoal
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333), // Dark Charcoal
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
            Text(
              '${l10n.pricePerPerson}: \$${activity.price}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF757575), // Cool Gray
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.continueToAccommodation,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333), // Dark Charcoal
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              l10n.cancel,
              style: const TextStyle(
                color: Color(0xFF757575), // Cool Gray
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
              backgroundColor: const Color(0xFF388E3C), // Forest Green
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.continueText),
          ),
        ],
      ),
    );
  }
}