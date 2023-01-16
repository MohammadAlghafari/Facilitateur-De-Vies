import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditIcon extends StatelessWidget {
  const EditIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.r,
      height: 15.r,
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: AppColors.whiteColor,
        size: 7.r,
      ),
    );
  }
}
