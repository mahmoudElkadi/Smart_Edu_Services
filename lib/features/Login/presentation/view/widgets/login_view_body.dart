import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/stylies.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Login/presentation/view/widgets/form_login.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 70.h),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
            const HeightSpacer(20),
            const Text(
              "SmartEduServices",
              style: Styles.textStyle30,
            ),
            const HeightSpacer(35),
            const Text(
              "Hello there!",
              style: Styles.textStyle16,
            ),
            const HeightSpacer(8),
            const Text(
              "Sign In And Start Managing Your Items.",
              style: Styles.textStyle16,
            ),
            const HeightSpacer(20),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.h),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: const LoginForm()),
          ],
        ),
      ),
    );
  }
}
