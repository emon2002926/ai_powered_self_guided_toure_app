import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';

import '../../constant/app_assert_image.dart';
import '../../widget/app_bar/build_app_bar.dart';
class CluePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssertImage.instance.backgroundImage, // Make sure this points to the blurred image
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          filterQuality: FilterQuality.low,
        ),
        SafeArea(child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BuildAppBar( title: 'Sign In',),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.asset(AppAssertImage.instance.clueMap),
          ),
        ))
        )],

    );
  }
}