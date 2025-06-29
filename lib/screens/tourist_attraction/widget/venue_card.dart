import 'package:ai_powered_self_guided_toure_app/constant/app_constant.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../../repository/city_data/data/models/city_model.dart';
import '../../../repository/venue_data/venue_model.dart';

class VenueCard extends StatelessWidget {
  final List<VenueModel> venueList;  // <-- Change here
  final int index;
  final VoidCallback onPressed;

  const VenueCard({
    super.key,
    required this.venueList,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final venue = venueList[index]; // ✅ This now works


    return GestureDetector(
      onTap: onPressed,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Example: image takes 60% height, content takes 40%
          final imageHeight = constraints.maxHeight * 0.6;
          final contentHeight = constraints.maxHeight * 0.4;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: Image.asset(
                      venue.imageUrl,

                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: contentHeight,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppText(
                            data: venue.venueName,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis
                        ),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: venue.statusText,
                                style: TextStyle(
                                  color: Colors.greenAccent, // 🟢 Or any color you want
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: venue.closingTime,
                                style: TextStyle(
                                  color: AppColors.instance.white50, // 🔘 Your faded white
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: AppConstant.instance.poppins
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
