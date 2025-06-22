import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';

class CityCardWidget extends StatelessWidget {
  final String imageUrl;
  final String cityLabel;
  final int currentPage;
  final int totalPages;

  const CityCardWidget({
    super.key,
    required this.imageUrl,
    required this.cityLabel,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 2),
            child: AppText(

              data: cityLabel,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,

            ),
          ),
        ),
      ],
    );
  }
}
