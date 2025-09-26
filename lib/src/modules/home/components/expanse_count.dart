import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class ExpenseCount extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double valor;
  final Color color;

  const ExpenseCount(
      {super.key,
      required this.title,
      required this.icon,
      required this.valor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: AppColors.appPageBackground,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 4,
                ),
                Icon(icon, color: AppColors.appPageBackground),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("R\$: ${valor.toString()}",
                    style: const TextStyle(
                        color: AppColors.appPageBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
