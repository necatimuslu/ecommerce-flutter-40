import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 30,
              color: AppColors.iconColor1,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('Normal'),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 30,
              color: AppColors.mainColor,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('1.7km')
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.schedule,
              size: 30,
              color: AppColors.iconColor2,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('32 min'),
          ],
        ),
      ],
    );
  }
}
