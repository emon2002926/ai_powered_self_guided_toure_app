import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class CityCardWidget extends StatelessWidget {
  final String imageUrl;
  final String cityLabel;
  final VoidCallback onPressed;
  final int currentPage;
  final int totalPages;
  const CityCardWidget({
    super.key,
    required this.imageUrl,
    required this.cityLabel,
    required this.currentPage,
    required this.totalPages, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return
      Card(
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



}
