import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class AppErrorLogo extends StatelessWidget {
  final String title;
  final double? titleSize;
  final double? iconSize;

  const AppErrorLogo({
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
          Icons.error_rounded,
          color: AppColors.expense,
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
                  color: AppColors.black,
                  fontSize: titleSize ?? 20,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
