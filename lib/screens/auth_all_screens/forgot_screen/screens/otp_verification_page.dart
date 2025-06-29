import 'package:ai_powered_self_guided_toure_app/widget/app_bar/build_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../constant/app_assert_image.dart';
import '../../../../constant/app_colors.dart';
import '../../../../widget/buttons/app_button.dart';
import '../../../../widget/text/app_text.dart';


class OtpVerificationPage extends StatefulWidget {
  final String email;

  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _otpCode =>
      _otpControllers.map((controller) => controller.text).join();

  void _verifyCode() {
    if (_otpCode.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Code verified!"),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the full 6-digit code."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP resent to your email."),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(title: "Verify Email"),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            AppAssertImage.instance.backgroundImage,fit: BoxFit.cover,filterQuality: FilterQuality.low,)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  const AppText(
                    data: 'Check your email',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    data:
                    'We sent a reset link to ${widget.email}\nPlease enter the 6 digit code.',
                    fontSize: 14,
                    color: AppColors.instance.white50,
                    textAlign: TextAlign.center,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 40,
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: (value) => _onOtpChanged(value, index),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.grey, // unfocused border color
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.instance.dark400, // focused border color
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red, // error border
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _resendOtp,
                      child: AppText(
                        data: 'Resend OTP',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.instance.white50,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  AppButton(
                    buttonText: "Verify Code",
                    onPressed: (){},
                    borderRadius: 25,
                    buttonColor: AppColors.instance.transparent,
                    borderColor: AppColors.instance.white50,
                    borderWidth: 1.5,
                    buttonHeight: 48,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
