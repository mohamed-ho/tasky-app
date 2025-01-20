import 'package:flutter/material.dart';
import 'package:tasky/core/constant/app_colors.dart';

getPriorityColor(String periority) {
  switch (periority) {
    case 'low':
      return AppColors.finishedTaskTypeColor;
    case 'mediam':
      return AppColors.inProgressTaskTypeColor;
    case 'high':
      return AppColors.watingTaskTypeColor;
    default:
      return Colors.grey;
  }
}
