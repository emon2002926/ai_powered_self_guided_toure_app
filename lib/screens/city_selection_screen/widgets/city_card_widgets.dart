import 'dart:ffi';

import 'package:ai_powered_self_guided_toure_app/repository/city_data/data/models/city_model.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_colors.dart';
import '../../../widget/buttons/app_button.dart';

class CityCard  extends StatelessWidget {
  final List<CityModel> cities;
  final int index;
  final int currentPage;
  final int totalPages;
  final VoidCallback onPressed;
  const CityCard ({super.key,required this.cities,
    required this.currentPage,required this.totalPages,
    required this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
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
                cities[index].imageUrl,
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
                buttonText: cities[index].name,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
