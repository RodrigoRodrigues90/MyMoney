import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class AppValidateLogo extends StatelessWidget {
  final String title;
  final double? titleSize;
  final double? iconSize;

  const AppValidateLogo({
    super.key,
    required this.title,
    this.titleSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.logo,
          size: iconSize ?? 50,
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 25,
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.logo,
                  fontSize: titleSize ?? 20,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
