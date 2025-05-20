import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize pages here where we have access to l10n
    final l10n = AppLocalizations.of(context)!;
    
    _pages = [
      OnboardingPage(
        title: l10n.onboardingTitle1,
        description: l10n.onboardingDesc1,
        icon: Icons.landscape,
        image: 'assets/images/heroes/atlas_mountains_hero.jpg',
        showLogo: true, // Show logo on first page
      ),
      OnboardingPage(
        title: l10n.onboardingTitle2,
        description: l10n.onboardingDesc2,
        icon: Icons.local_activity,
        image: 'assets/images/activities/waterfall_hike.jpg',
      ),
      OnboardingPage(
        title: l10n.onboardingTitle3,
        description: l10n.onboardingDesc3,
        icon: Icons.house,
        image: 'assets/images/accommodation/berber_tent.jpg',
      ),
      OnboardingPage(
        title: l10n.onboardingTitle4,
        description: l10n.onboardingDesc4,
        icon: Icons.eco,
        image: 'assets/images/heroes/bivouac_camp.jpg',
      ),
    ];
  }

  List<OnboardingPage> _pages = [];

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) {
      // Return loading indicator while pages are being initialized
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final l10n = AppLocalizations.of(context)!;

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
          _buildBottomSection(l10n),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Flexible image container with logo support
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                ),
                child: Center(
                  child: page.showLogo
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // App Logo
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.4,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/heroes/logo.jpg',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback to icon if logo is not found
                                  return Icon(
                                    page.icon,
                                    size: MediaQuery.of(context).size.width * 0.2,
                                    color: const Color(0xFF4CAF50),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Welcome text for logo page
                            Text(
                              AppLocalizations.of(context)!.welcome,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.06,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFF757575),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Icon(
                          page.icon,
                          size: MediaQuery.of(context).size.width * 0.25,
                          color: const Color(0xFF4CAF50),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Flexible content section
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    page.title,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        page.description,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: const Color(0xFF666666),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: const Offset(0, -5),
        //   ),
        // ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => _buildDot(index),
              ),
            ),
            const SizedBox(height: 24),
            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      l10n.previous,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                else
                  const SizedBox(width: 80),
                
                // Next/Get Started button
                ElevatedButton(
                  onPressed: _currentPage < _pages.length - 1
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                      : () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    _currentPage < _pages.length - 1 ? l10n.next : l10n.getStarted,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
  final bool showLogo;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
    this.showLogo = false,
  });
}