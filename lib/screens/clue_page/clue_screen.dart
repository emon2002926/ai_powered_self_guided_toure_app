import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_assert_image.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_bar/build_app_bar.dart';
class ClueScreen extends StatefulWidget {
  const ClueScreen({super.key});

  @override
  State<ClueScreen> createState() => _ClueScreenState();
}

class _ClueScreenState extends State<ClueScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(title: "Clues",),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssertImage.instance.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildClueItem(1, true),
                    _buildClueItem(1, false),
                    _buildClueItem(1, false),
                    _buildClueItem(1, true),
                    _buildClueItem(1, false),
                    _buildClueItem(1, true),
                    _buildClueItem(1, false),

                  ],

                ),
              ))

        ],
      ),

    );
  }


  Widget _buildClueItem(int number, bool isCompleted) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.submitPage,);

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Find the glowing ball in the sky, and snap a selfie with it behind you – bonus if it lights up at night!',
                      style: const TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  isCompleted
                      ? const Icon(Icons.check_circle, color: Colors.greenAccent, size: 32.0)
                      : const Icon(Icons.camera_alt, color: Colors.white70, size: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
