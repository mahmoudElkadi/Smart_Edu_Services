import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/dropdown_item.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'freelancer_detials_view.dart';

class AddNewFreelancerViewBody extends StatefulWidget {
  const AddNewFreelancerViewBody({super.key});

  @override
  State<AddNewFreelancerViewBody> createState() =>
      _AddNewFreelancerViewBodyState();
}

class _AddNewFreelancerViewBodyState extends State<AddNewFreelancerViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                "Add New Freelancer",
                style: appStyle(20, Colors.black, FontWeight.w900),
              ),
            ),
            const HeightSpacer(50),
            Form(
              child: Column(
                children: [
                  TaskTextItem(
                    title: "User Name",
                    hint: "User Name",
                    controller: userNameController,
                  ),
                  const HeightSpacer(15),
                  TaskTextItem(
                    title: "Email",
                    hint: "Email",
                    controller: emailController,
                  ),
                  const HeightSpacer(15),
                  TaskTextItem(
                    title: "Phone",
                    hint: "Phone",
                    controller: phoneController,
                  ),
                  const HeightSpacer(15),
                  TaskDropdownItem(
                    title: 'Country',
                    hint: 'Country',
                    drobDown: store,
                  ),
                  const HeightSpacer(15),
                  TaskDropdownItem(
                    title: 'Currency',
                    hint: 'Currency',
                    drobDown: store,
                  ),
                  const HeightSpacer(15),
                  TaskDropdownItem(
                    title: 'Speciality',
                    hint: 'Specialities',
                    drobDown: store,
                  ),
                  const HeightSpacer(15),
                  TaskDropdownItem(
                    title: 'Level Of Experience',
                    hint: 'Level of exp',
                    drobDown: store,
                  ),
                  const HeightSpacer(40),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      backGroundColor: Colors.blue,
                      width: 200.w,
                      text: "Add",
                      onTap: () async {
                        Get.to(() => const FreelancerDetialsView());
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
                ],
              ),
            ),
            const HeightSpacer(50)
          ],
        )),
      ),
    );
  }
}