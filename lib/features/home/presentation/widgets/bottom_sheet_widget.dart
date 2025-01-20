import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {super.key, required this.camera, required this.gallery});
  final Function()? camera;
  final Function()? gallery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'please Choose the Image',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.mainAppColor),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: camera,
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.mainAppColor,
                  weight: 30.w,
                ),
                Text(
                  'Camera',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainAppColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: gallery,
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  color: AppColors.mainAppColor,
                  weight: 30.w,
                ),
                Text(
                  'Gallary',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainAppColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
