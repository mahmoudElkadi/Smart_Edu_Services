import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/dropdown_item.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';
import 'package:smart/features/Users/presentation/view/widgets/user_detials.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class AddNewUserViewBody extends StatefulWidget {
  const AddNewUserViewBody({super.key});

  @override
  State<AddNewUserViewBody> createState() => _AddNewUserViewBodyState();
}

class _AddNewUserViewBodyState extends State<AddNewUserViewBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? dateStartValue;
  String? dateEndValue;

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15.0.h),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add New User",
                style: appStyle(20, Colors.black, FontWeight.w900),
              ),
            ),
            const HeightSpacer(50),
            TaskTextItem(
              title: "Full Name",
              hint: "Enter Your Name",
              controller: fullNameController,
            ),
            const HeightSpacer(15),
            TaskTextItem(
              title: "User Name",
              hint: "User Name",
              controller: userNameController,
            ),
            const HeightSpacer(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    "Password",
                    style: appStyle(16, Colors.black, FontWeight.w500),
                    maxLines: 2,
                  ),
                ),
                CustomTextField(
                  width:
                      MediaQuery.of(context).size.width > 600 ? 600.w : 250.w,
                  color: Colors.transparent,
                  controller: passwordController,
                  label: "Password",
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.visibility_off),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return ' must not be Empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const HeightSpacer(15),
            TaskDropdownItem(
              title: 'Country',
              hint: 'Country',
              drobDown: store,
            ),
            const HeightSpacer(15),
            TaskDropdownItem(
              title: 'Role',
              hint: 'Roles',
              drobDown: store,
            ),
            const HeightSpacer(15),
            TaskTextItem(
              title: "Phone",
              hint: "Phone",
              controller: phoneController,
            ),
            const HeightSpacer(40),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                backGroundColor: Colors.blue,
                width: 200.w,
                text: "Add",
                onTap: () async {
                  Get.to(() => const UserDetialsView());
                  // Get.to(()=>MainView());
                  // if(formKey.currentState!.validate()){
                  //   LoginModel model = LoginModel(
                  //       email: LoginCubit.get(context).email.text,
                  //       password: LoginCubit.get(context).password.text);
                  //   await LoginCubit.get(context).userLogin(model);
                  // }
                },
              ),
            ),
            const HeightSpacer(50)
          ],
        )),
      ),
    );
  }
}
