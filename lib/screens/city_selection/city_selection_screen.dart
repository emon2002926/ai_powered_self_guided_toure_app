import 'package:ai_powered_self_guided_toure_app/screens/city_selection/widgets/city_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_assert_image.dart';
import '../../routes/app_routes.dart';
import '../../util/sample_data/city_list.dart';
import '../../widget/text/app_text.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssertImage.instance.backgroundImage, // make sure this is your blurred image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.low,
          ),

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
                        child: CityCard(
                          cities: cities,
                          currentPage: 1,
                          totalPages: 3,
                          index: index,
                          onPressed: () => Get.toNamed(AppRoutes.landMark),
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


}
