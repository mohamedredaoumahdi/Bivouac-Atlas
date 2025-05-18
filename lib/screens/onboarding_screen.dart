import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Welcome to Bivouac Atlas',
      description: 'Discover the authentic beauty of the Atlas Mountains in Morocco\'s Azilal region.',
      icon: Icons.landscape,
      image: 'assets/images/heroes/atlas_mountains_hero.jpg',
    ),
    OnboardingPage(
      title: 'Authentic Experiences',
      description: 'Choose from 10+ unique activities including waterfall hikes, village tours, and traditional cooking.',
      icon: Icons.local_activity,
      image: 'assets/images/activities/waterfall_hike.jpg',
    ),
    OnboardingPage(
      title: 'Traditional Accommodation',
      description: 'Stay in authentic Berber tents or eco-friendly wooden cabins surrounded by nature.',
      icon: Icons.house,
      image: 'assets/images/accommodation/berber_tent.jpg',
    ),
    OnboardingPage(
      title: 'Sustainable Tourism',
      description: 'Support local communities while enjoying an eco-friendly adventure in the mountains.',
      icon: Icons.eco,
      image: 'assets/images/heroes/bivouac_camp.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) => _buildPage(_pages[index]),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF4CAF50).withOpacity(0.1),
            ),
            child: Center(
              child: Icon(
                page.icon,
                size: 120,
                color: const Color(0xFF4CAF50),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => _buildDot(index),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                TextButton(
                  onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: const Text(
                    'Previous',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              else
                const SizedBox(width: 80),
              if (_currentPage < _pages.length - 1)
                ElevatedButton(
                  onPressed: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          if (_currentPage < _pages.length - 1)
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 12 : 8,
      height: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? const Color(0xFF4CAF50)
            : const Color(0xFF4CAF50).withOpacity(0.3),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final IconData icon;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });
}