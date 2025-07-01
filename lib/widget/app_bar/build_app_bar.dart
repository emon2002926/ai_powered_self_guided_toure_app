import 'package:flutter/material.dart';
import '../text/app_text.dart';
import 'dart:ui';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? iconColor;
  final bool enableFrostEffect; // 🔹 Optional flag

  const BuildAppBar({
    super.key,
    required this.title,
    this.titleColor,
    this.iconColor,
    this.enableFrostEffect = false, // 🔹 default false
  });

  @override
  Widget build(BuildContext context) {
    final appBarContent = AppBar(
      backgroundColor: enableFrostEffect
          ? Colors.white.withOpacity(0.15)
          : Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: iconColor ?? Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: AppText(
        data: title,
        color: titleColor ?? Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );

    return enableFrostEffect
        ? ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: appBarContent,
      ),
    )
        : appBarContent;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
