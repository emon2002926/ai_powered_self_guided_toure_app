import 'dart:ui';
import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_assert_image.dart';
import '../../constant/app_colors.dart';
import '../../util/sample_data/city_list.dart';
import '../../widget/buttons/app_button.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../constant/app_colors.dart';
import '../../util/sample_data/city_list.dart';
import '../../widget/buttons/app_button.dart';
import '../../widget/text/app_text.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({super.key});

  final String backgroundImage = "assets/background/city_background.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Blurred Background Image
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Image.asset(
                AppAssertImage.instance.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔹 Foreground Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: const BackButton(color: Colors.white),
                  title: const AppText(
                    data: "City Selection",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  centerTitle: true,
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: AppText(
                      data: "Choose your city",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final city = cities[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: cityCardWidget(
                          city.imageUrl,
                          city.name,
                          1,
                          3,
                              () {
                            Get.toNamed(AppRoutes.landMark);
                          },
                        ),
                      );
                    },
                    childCount: cities.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Frosted Glass City Card
  Widget cityCardWidget(String imageUrl, String cityLabel, int currentPage, int totalPages, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalPages, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index ? Colors.grey[800] : Colors.grey[300],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: AppButton(
                    textColor: Colors.white,
                    buttonColor: AppColors.instance.transparent,
                    buttonText: cityLabel,
                    onPressed: (){
                      Get.toNamed(AppRoutes.landMark);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
