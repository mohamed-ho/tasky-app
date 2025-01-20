import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/config/themes/app_text_themes.dart';
import 'package:tasky/core/constant/app_colors.dart';
import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_international_phone_number_input.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({super.key});

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'EG';

  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool passwordHite = true;
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: AppTextThemes.fontDMweight700Size24,
            ),
            SizedBox(height: 14.h),
            CustomInternationalPhoneNumberInput(
                controller: phoneController,
                onInputChanged: (value) {
                  number = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(
                          r'^\+?[0-9]{1,4}?[-. \(\)]?(\(?\d{1,3}?\)?[-. \(\)]?)?[0-9]{1,4}[-. \(\)]?[0-9]{1,4}[-. \(\)]?[0-9]{1,9}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onInputValidated: (value) {
                  if (value) log('validate number');
                },
                phoneNumber: number),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'password',
              hite: passwordHite,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter password";
                } else if (value.length < 6) {
                  return "password should be more than 5 digit";
                }
                return null;
              },
              suffix: passwordHite
                  ? InkWell(
                      onTap: () => setState(() {
                        passwordHite = !passwordHite;
                      }),
                      child: Icon(
                        Icons.visibility,
                        color: AppColors.textfieldGrey,
                      ),
                    )
                  : InkWell(
                      onTap: () => setState(() {
                        passwordHite = !passwordHite;
                      }),
                      child: Icon(
                        Icons.visibility_off,
                        color: AppColors.textfieldGrey,
                      ),
                    ),
            ),
            CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).login(
                      phone: number.phoneNumber!,
                      password: passwordController.text,
                    );
                  }
                },
                text: 'Sign In'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t have any account?',
                    style: AppTextThemes.fontDMWight400Size14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signupScreen);
                    },
                    child: Text(
                      'Sign Up here',
                      style: AppTextThemes
                          .fontDMWight400Size14ColorMainColorStyleUnderLine,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
