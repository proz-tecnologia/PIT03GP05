import 'package:flutter/material.dart';
import 'package:planney/style/style.dart';

class PlanneyLogo extends StatelessWidget {
  const PlanneyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Planney',
          style: TextStyle(
              color: AppStyle.button1Color,
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        const SizedBox(
          width: 6,
        ),
        Stack(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: AppStyle.cardBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42),
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppStyle.button1Color,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
