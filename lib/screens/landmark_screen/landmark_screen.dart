import 'dart:async';
import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/widget/app_bar/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/util/sample_data/city_list.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import '../../routes/app_routes.dart';

class LandmarkPage extends StatefulWidget {
  const LandmarkPage({super.key});

  @override
  State<LandmarkPage> createState() => _LandmarkPageState();
}

class _LandmarkPageState extends State<LandmarkPage> {
  final PageController _pageController = PageController();
  Timer? _autoScrollTimer;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentImageIndex + 1) % cities.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,

        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: BuildAppBar(title: "Landmark",),
      body: Stack(
        children: [
          // Background blur with current city image
          Positioned.fill(
            child: Image.asset(
              AppAssertImage.instance.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Visited places'),
                _buildImageCarousel(),
                _buildPageIndicators(),
                _buildSectionTitle('What kind of ride would you like to take?'),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 12),
      child: AppText(
        data: title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,

      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 280,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentImageIndex = index),
        itemCount: cities.length,
        itemBuilder: (context, index) => _buildImageCard(index),
      ),
    );
  }

  Widget _buildImageCard(int index) {
    final city = cities[index];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              city.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withOpacity(0.3)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AppText(
                  data: city.name,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          cities.length,
              (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentImageIndex == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: _currentImageIndex == index
                  ? Colors.black87
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppButton(
              buttonText: "Free Tour selected",
              onPressed: () {
                Get.toNamed(AppRoutes.touristAttraction, arguments: "Tourist Attraction");
              },
              buttonColor: AppColors.instance.transparent,
              borderColor: AppColors.instance.white50,
              borderWidth: 1.5,
              buttonHeight: 60,
            ),
            const SizedBox(height: 30),
            AppButton(
              buttonText: "A Scavenger Hunt",
              onPressed: () {
                Get.toNamed(AppRoutes.touristAttraction, arguments: "Scavenger Hunt");
              },
              buttonColor: AppColors.instance.transparent,
              borderColor: AppColors.instance.white50,
              borderWidth: 1.5,
              buttonHeight: 60,
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

}