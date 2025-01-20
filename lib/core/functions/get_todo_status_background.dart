import 'package:flutter/material.dart';
import 'package:tasky/core/constant/app_colors.dart';

Color getTodoStatusBackground(String todoStatus) {
  switch (todoStatus) {
    case 'waiting' || 'low':
      return AppColors.watingTaskTypeBackColor;
    case 'Inprogress' || 'medium':
      return AppColors.inProgressTaskTypeBackColor;
    case 'finished' || 'high':
      return AppColors.finishedTaskTypeBackColor;
    default:
      return Colors.grey;
  }
}
