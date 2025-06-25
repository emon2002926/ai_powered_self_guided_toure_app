import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_assert_image.dart';
import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../util/sample_data/city_list.dart';
import '../../widget/buttons/app_button.dart';
import '../../widget/text/app_text.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Blurred Background using `blur` package
          Image.asset(
            AppAssertImage.instance.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.low,
          ).blurred(
            blur: 8,
            blurColor: Colors.black.withOpacity(0.15),
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
                      return RepaintBoundary(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: cityCardWidget(
                            city.imageUrl,
                            city.name,
                            1,
                            3,
                                () => Get.toNamed(AppRoutes.landMark),
                          ),
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

  /// 🔹 City Card (not blurred inside list for better performance)
  Widget cityCardWidget(
      String imageUrl,
      String cityLabel,
      int currentPage,
      int totalPages,
      VoidCallback onPressed,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
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
                filterQuality: FilterQuality.low,
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
                    color: currentPage == index
                        ? Colors.grey[800]
                        : Colors.grey[300],
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
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
