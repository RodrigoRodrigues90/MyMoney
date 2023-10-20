import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  final NotchedShape shape;
  const CustomBottomAppBar({
    required this.shape,
  });
  @override
  Widget build(BuildContext context,) {
    return Container(
      height: 20,
      color: AppColors.logo,
      child: Row(),
    );
  }
}
