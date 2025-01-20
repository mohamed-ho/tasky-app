import 'package:flutter/material.dart';
import 'package:tasky/core/constant/app_colors.dart';

Color getTodoStatusForground(String todoStatus) {
  switch (todoStatus) {
    case 'waiting' || 'low':
      return AppColors.watingTaskTypeColor;
    case 'Inprogress' || 'medium':
      return AppColors.inProgressTaskTypeColor;
    case 'finished' || 'high':
      return AppColors.finishedTaskTypeColor;
    default:
      return Colors.grey;
  }
}
