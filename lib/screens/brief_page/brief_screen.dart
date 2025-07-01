import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_assert_image.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_constant.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_bar/build_app_bar.dart';
import '../../widget/buttons/app_button.dart';
import '../../widget/dialog/app_dialog.dart';
import '../../widget/text/app_text.dart';

class BriefScreen extends StatefulWidget {
  const BriefScreen({super.key});

  @override
  State<BriefScreen> createState() => _BriefScreenState();
}

class _BriefScreenState extends State<BriefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BuildAppBar(title: "Brief",),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              AppAssertImage.instance.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(

              children: [
                const SizedBox(height: kToolbarHeight + 60),

                // Main Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AppAssertImage.instance.scavengeImage,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.instance.transparent,
                      border: Border.all(color: AppColors.instance.white50, width: 1.5),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.pause_circle_outline_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: 16), // spacing between icon and animation
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: Lottie.asset(
                              'assets/animations/speak.json',
                              fit: BoxFit.fill,
                              repeat: true,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.instance.transparent,
                    border: Border.all(color: AppColors.instance.white50, width: 1.5),
                  ),
                  padding: const EdgeInsets.all(6),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height:50,
                          width: 50,
                          child:Lottie.asset(
                            'assets/animations/mic.json',
                            width: double.infinity,
                            height: 50,
                            repeat: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: AppText(data: "Ask something"),
                      )
                    ]
                  )
                ),
                SizedBox(height: 30,),

                SizedBox(
                  width: double.infinity,
                  child: Center(child: AppText(data: "Or",fontSize: 20,fontWeight: FontWeight.w400,)),
                ),
                SizedBox(height: 30,),

                // Button Row
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: AppButton(
                          buttonText: "Finished",
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AppDialog(
                                title: "Finished",
                                description: "Are you sure you want to finish your tour? ",
                                onConfirm: () {
                                  Get.offAllNamed(AppRoutes.citySearch);

                                  // Your confirm logic
                                },
                                onCancel: () {
                                  Navigator.pop(context);
                                  // Your cancel logic
                                },
                              ),
                            );
                          },
                          buttonColor: AppColors.instance.transparent,
                          borderColor: AppColors.instance.white50,
                          borderRadius: 12,
                          fontFamily: AppConstant.instance.poppins,
                          borderWidth: 1.5,
                          fontWeight: FontWeight.normal,
                          // enableFrostEffect: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: AppButton(
                          buttonText: "Next page",
                          onPressed: () {
                            Get.toNamed(AppRoutes.touristAttraction);

                          },
                          buttonColor: AppColors.instance.transparent,
                          borderColor: AppColors.instance.white50,
                          borderRadius: 12,
                          fontFamily: AppConstant.instance.poppins,
                          borderWidth: 1.5,
                          fontWeight: FontWeight.normal,
                          // enableFrostEffect: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
