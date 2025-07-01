import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_constant.dart';
import 'package:ai_powered_self_guided_toure_app/widget/app_bar/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/app_assert_image.dart';
import '../../routes/app_routes.dart';
import '../../widget/buttons/app_button.dart';
import '../../widget/dialog/app_dialog.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(title: "Submit",),
      body: Stack(
          children:[

            Positioned.fill(
              child: Image.asset(
                AppAssertImage.instance.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                  // Top image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppAssertImage.instance.clueMap, // Replace with your image path
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

                  // Take a picture button
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: AppButton(buttonText: "Take a picture", onPressed: (){},
                      buttonColor: AppColors.instance.transparent,
                      borderColor: AppColors.instance.white50,
                      borderRadius: 12,
                      fontFamily: AppConstant.instance.poppins,
                      borderWidth: 1.5,
                      fontWeight: FontWeight.normal,
                      prefixIcon: Icons.camera_alt_outlined,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: AppButton(buttonText: "Submit",
                      onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AppDialog(
                            onConfirm: () {
                              Get.back();
                              Get.toNamed(AppRoutes.clues);

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
                      prefixIcon: Icons.send,
                    ),
                  ),

                ],
              ),
            ),

          ]
      ),
    );
  }
}
