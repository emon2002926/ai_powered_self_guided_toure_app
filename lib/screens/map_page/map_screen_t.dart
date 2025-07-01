import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_assert_image.dart';
import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_bar/build_app_bar.dart';

class MapScreenT extends StatefulWidget {
  const MapScreenT({super.key});

  @override
  State<MapScreenT> createState() => _MapScreenTState();
}

class _MapScreenTState extends State<MapScreenT> {
  late String appBarTitle;

  @override
  void initState() {
    super.initState();
    appBarTitle = Get.arguments as String? ?? "Tourist Attraction";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(
        title: appBarTitle, // Use the dynamic appBarTitle instead of hardcoded "Map"
        titleColor: Colors.grey[800],
        iconColor: Colors.grey[800],
        enableFrostEffect: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssertImage.instance.map,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: AppButton(
                    buttonText: "Reached",
                    textColor: Colors.grey[800],
                    onPressed: () {
                      if (appBarTitle == "Tourist Attraction") {
                        Get.toNamed(AppRoutes.landmarkBrief);
                      }

                      else {
                        Get.toNamed(AppRoutes.clues);
                      }
                    },
                    borderColor: Colors.greenAccent,
                    buttonColor: AppColors.instance.transparent,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    enableFrostEffect: true,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}