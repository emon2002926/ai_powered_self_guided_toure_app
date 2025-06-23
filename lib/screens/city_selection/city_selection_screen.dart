import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constant/app_colors.dart';
import '../../repository/city_data/data/models/city_model.dart';
import '../../util/sample_data/city_list.dart';
import '../../widget/buttons/app_button.dart';
import 'widgets/city_card_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/city_card_widget.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar that hides on scroll up
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              leading: const BackButton(color: Colors.black),
              title: const AppText(data: "City Selection", color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500,),
              centerTitle: true,
            ),

            // Header: "Choose your city"
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: AppText(
                  data: "Choose your city",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            // List of cities
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final city = cities[index];
                  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child:  cityCardWidget(
                      city.imageUrl,
                      city.name,
                      1,
                      3,
                      () {
                        Get.toNamed(AppRoutes.landMark);
                      },
                    ),
                  );


                  // return Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //   child: cityCardWidget(
                  //     onPressed: () {
                  //       Get.toNamed(AppRoutes.landMark);
                  //     },
                  //     imageUrl: city.imageUrl,
                  //     cityLabel: city.name,
                  //     currentPage: 1,
                  //     totalPages: 3,
                  //   ),
                  // );
                },
                childCount: cities.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cityCardWidget(String imageUrl, String cityLabel, int currentPage, int totalPages, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(

          color: AppColors.instance.cardBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
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
                buttonColor: AppColors.instance.loginBtnColor, buttonText: cityLabel, onPressed:onPressed,
              ),
            ),
          ],
        ),
      ),
    );

  }

  ////////////////////////

  // Widget _buildImageCarousel() {
  //   return SizedBox(
  //     height: 280,
  //     child: PageView.builder(
  //       onPageChanged: (index) => setState(() => _currentImageIndex = index),
  //       itemCount: cities.length,
  //       itemBuilder: (context, index) => _buildImageCard(index),
  //     ),
  //   );
  // }
  //
  // Widget _buildImageCard(int index) {
  //   final city = cities[index];
  //
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 16),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(16),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 8,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(16),
  //       child: Stack(
  //         fit: StackFit.expand,
  //         children: [
  //           Image.asset(
  //             city.imageUrl,
  //             fit: BoxFit.cover,
  //           ),
  //           Container(
  //             color: Colors.black.withOpacity(0.3),
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Padding(
  //               padding: const EdgeInsets.all(16),
  //               child: AppText(
  //                 data: city.name,
  //                 color: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
/////////////////////////////////
}