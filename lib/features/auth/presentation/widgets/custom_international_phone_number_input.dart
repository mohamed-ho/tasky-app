import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:tasky/core/constant/app_colors.dart';

class CustomInternationalPhoneNumberInput extends StatelessWidget {
  const CustomInternationalPhoneNumberInput(
      {super.key,
      required this.controller,
      required this.onInputChanged,
      required this.onInputValidated,
      required this.phoneNumber,
      required this.validator});
  final TextEditingController controller;
  final PhoneNumber phoneNumber;
  final void Function(PhoneNumber) onInputChanged;
  final void Function(bool) onInputValidated;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(color: AppColors.textfieldGrey)),
        child: InternationalPhoneNumberInput(
          onInputChanged: onInputChanged,
          onInputValidated: onInputValidated,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          validator: validator,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: AppColors.textfieldGrey),
          textStyle: TextStyle(color: AppColors.textfieldGrey),
          initialValue: phoneNumber,
          textFieldController: controller,
          formatInput: true,
          inputBorder: InputBorder.none,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
        ),
      ),
    );
  }
}
