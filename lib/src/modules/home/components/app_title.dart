import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final double? titleSize;
  final double? iconSize;

  const AppTitle({
    super.key, 
    required this.title,
    this.iconSize,
    this.titleSize,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.currency_exchange,
            color: AppColors.logo,
            size: iconSize ?? 22,   
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.logo,
                  fontSize: titleSize ?? 20,
                  fontWeight: FontWeight.w800),
            ))
      ],
    );
  }
}
