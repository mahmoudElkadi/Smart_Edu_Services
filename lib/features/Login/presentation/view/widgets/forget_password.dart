import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/widgets/custom_form_field.dart';

import '../../../../../core/utils/stylies.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Main/presentation/views/main_view.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const HeightSpacer(20),
              const Text(
                "SmartEduServices",
                style: Styles.textStyle30,
              ),
              const HeightSpacer(35),
              const Text(
                "Enter Your Email and We send a password reset link.",
                style: Styles.textStyle14,
              ),
              const HeightSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Email",
                        color: Colors.white,
                        controller: email,
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ' must not be Empty';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(30),
                      CustomButton(
                        backGroundColor: Colors.blue,
                        width: 180.w,
                        text: "Send Request",
                        onTap: () async {
                          Get.to(() => const MainView());
                          // Get.to(()=>MainView());
                          // if(formKey.currentState!.validate()){
                          //   LoginModel model = LoginModel(
                          //       email: LoginCubit.get(context).email.text,
                          //       password: LoginCubit.get(context).password.text);
                          //   await LoginCubit.get(context).userLogin(model);
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
