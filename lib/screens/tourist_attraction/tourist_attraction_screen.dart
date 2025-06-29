import 'package:ai_powered_self_guided_toure_app/screens/tourist_attraction/widget/venue_card.dart';
import 'package:ai_powered_self_guided_toure_app/util/sample_data/venue_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_assert_image.dart';
import '../../routes/app_routes.dart';
import '../../widget/text/app_text.dart';

class TouristAttractionScreen extends StatefulWidget {
  const TouristAttractionScreen({super.key});

  @override
  State<TouristAttractionScreen> createState() => _TouristAttractionScreenState();
}

class _TouristAttractionScreenState extends State<TouristAttractionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            AppAssertImage.instance.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.low,
          ),

          // Foreground Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: const BackButton(color: Colors.white),
                  title: const AppText(
                    data: "Tourist Attraction",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  centerTitle: true,
                ),

                // Subtitle
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: AppText(
                      data: "Set the venue", // changed from "Choose your city"
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Venue Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return VenueCard(
                          venueList: venueList,
                          index: index,
                          onPressed: () => Get.toNamed(AppRoutes.bevuTest),
                        );
                      },
                      childCount: venueList.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.90, // ✅ KEY: Adjust to avoid overflow
                    ),
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
