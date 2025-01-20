import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/home/presentation/widgets/profile_item_widget.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({super.key, required this.userData});
  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            ProfileItemWidget(subTitle: userData.displayName, title: 'NAME'),
            ProfileItemWidget(
                subTitle: userData.phone,
                title: 'PHONE',
                trailing: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: userData.phone,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Copied',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      backgroundColor: Colors.grey,
                    ));
                  },
                  icon: Icon(
                    Icons.copy_rounded,
                    color: AppColors.mainAppColor,
                    size: 30.w,
                  ),
                )),
            ProfileItemWidget(subTitle: userData.level, title: 'LEVEL'),
            ProfileItemWidget(
                subTitle: "${userData.displayName} years",
                title: 'YEARS OF EXPERIENCE'),
            ProfileItemWidget(subTitle: userData.address, title: 'LOCATION'),
          ],
        ),
      ),
    );
  }
}
