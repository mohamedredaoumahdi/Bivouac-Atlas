import 'package:flutter/material.dart';
import '../models/activity.dart';
import 'accommodation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Activity> activities = const [
    Activity(
      title: 'Waterfall Hike',
      description: 'Guided hike to discover stunning waterfalls around Azilal, with picnic stops and photo opportunities.',
      icon: Icons.water_drop,
      price: 70,
    ),
    Activity(
      title: 'Tajine Cooking Experience',
      description: 'Learn how to cook a traditional Berber tajine with locals in a cozy outdoor setting.',
      icon: Icons.restaurant,
      price: 80,
    ),
    Activity(
      title: 'Village Tour',
      description: 'Walk through Amazigh villages, meet local artisans, and learn about rural mountain life.',
      icon: Icons.location_city,
      price: 25,
    ),
    Activity(
      title: 'Mountain Trekking',
      description: 'A medium-level trekking adventure across scenic Atlas Mountain trails, ideal for nature lovers.',
      icon: Icons.hiking,
      price: 100,
    ),
    Activity(
      title: 'Lake Excursion',
      description: 'Day trip to the beautiful Bin El Ouidane Lake with optional boat ride and swimming.',
      icon: Icons.water,
      price: 70,
    ),
    Activity(
      title: 'Star Gazing Night',
      description: 'Night activity in the open camp to observe the stars with no light pollution. Includes storytelling and warm drinks.',
      icon: Icons.star,
      price: 10,
    ),
    Activity(
      title: 'Donkey Ride',
      description: 'Fun and safe ride for kids and adults along nature trails, guided by locals.',
      icon: Icons.pets,
      price: 25,
    ),
    Activity(
      title: 'Handicraft Workshop',
      description: 'Join local women in making rugs, pottery, or baskets using ancestral techniques.',
      icon: Icons.palette,
      price: 60,
    ),
    Activity(
      title: 'Forest Picnic',
      description: 'A calm picnic in a forested area with hammocks, local snacks, and a chance to relax.',
      icon: Icons.park,
      price: 25,
    ),
    Activity(
      title: 'Cave Exploration',
      description: 'Light adventure into natural caves of the Atlas Mountains with a local guide.',
      icon: Icons.explore,
      price: 50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Choose Your Activity'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_activity,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Select your adventure',
                        style: TextStyle(
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
                  const Text(
                    'Available Activities',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Choose the activity that interests you most. Each experience is guided by local experts.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
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
                      onTap: () => _selectActivity(context, activity),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                activity.icon,
                                color: const Color(0xFF4CAF50),
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
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF333333),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4CAF50),
                                          borderRadius: BorderRadius.circular(20),
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
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF666666),
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
                                        'Tap to select',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF4CAF50).withOpacity(0.7),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: const Color(0xFF4CAF50).withOpacity(0.7),
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

  void _selectActivity(BuildContext context, Activity activity) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Row(
          children: [
            Icon(
              activity.icon,
              color: const Color(0xFF4CAF50),
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text('Confirm Selection'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You selected: ${activity.title}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${activity.price} per person',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Would you like to continue to select your accommodation?',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
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
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}