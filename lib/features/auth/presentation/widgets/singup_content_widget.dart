import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tasky/config/themes/app_text_themes.dart';
import 'package:tasky/core/constant/app_colors.dart';
import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_dropdown_button_form_filed.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_international_phone_number_input.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_text_form_field.dart';

class SingupContentWidget extends StatefulWidget {
  const SingupContentWidget({super.key});

  @override
  State<SingupContentWidget> createState() => _SingupContentWidgetState();
}

class _SingupContentWidgetState extends State<SingupContentWidget> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experinceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'EG';
  String? dropDownValue;

  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool passwordHite = true;
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
            CustomTextFormField(
              hintText: 'Name...',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter your Name";
                } else if (value.length < 3) {
                  return "Name should be more than 2 character";
                }
                return null;
              },
            ),
            CustomInternationalPhoneNumberInput(
                controller: phoneController,
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
                onInputChanged: (value) {
                  number = value;
                },
                onInputValidated: (value) {},
                phoneNumber: number),
            CustomTextFormField(
                hintText: 'Years Of experience...',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please Enter your Experience years";
                  } else if (int.tryParse(value) == null) {
                    return "the experience years should be number";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: experinceController),
            CustomDropdownButtonFormField(
              value: dropDownValue,
              onChanged: (value) {
                dropDownValue = value;
                setState(() {});
              },
            ),
            CustomTextFormField(
              controller: addressController,
              hintText: 'Address...',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter your Address";
                } else if (value.length < 6) {
                  return "address should be more than 6 character";
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter your password";
                } else if (value.length > 6) {
                  return "passowrd should be more than 5 character";
                }
                return null;
              },
              hite: passwordHite,
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
                    if (dropDownValue != null) {
                      BlocProvider.of<AuthCubit>(context).register(
                          user: UserData(
                              address: addressController.text,
                              displayName: nameController.text,
                              experienceYears:
                                  int.parse(experinceController.text),
                              level: dropDownValue!,
                              password: passwordController.text,
                              phone: number.phoneNumber!));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'please choose you level',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ));
                    }
                  }
                },
                text: 'Sign Up'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have any account?',
                    style: AppTextThemes.fontDMWight400Size14,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Sign in',
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
