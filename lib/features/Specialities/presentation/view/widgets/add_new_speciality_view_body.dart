import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../../Users/presentation/view/widgets/user_detials.dart';
import 'edit_specailty_view.dart';

class AddNewSpecialityViewBody extends StatefulWidget {
  const AddNewSpecialityViewBody({super.key});

  @override
  State<AddNewSpecialityViewBody> createState() => _AddNewSpecialityViewBodyState();
}

class _AddNewSpecialityViewBodyState extends State<AddNewSpecialityViewBody> {
  TextEditingController subSpecialityController=TextEditingController();
  TextEditingController specialityController=TextEditingController();


  @override
  void dispose() {
    subSpecialityController.dispose();
    specialityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(15.0.h),
        child: SafeArea(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.all(12.h),
                  child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.h,
                  alignment: Alignment.bottomCenter,
                  child: Text("Add New Specialty",
                    style: appStyle(20, Colors.black, FontWeight.w900),
                  ),
                ),
                const HeightSpacer(50),
                TaskTextItem(title: "Sub-Speciality",hint: "Sub-Speciality", controller: subSpecialityController,),
                const HeightSpacer(15),
                TaskTextItem(title: "Speciality",hint: "Speciality", controller: specialityController,),
                const HeightSpacer(30),


                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    backGroundColor: Colors.blue,
                    width: 200.w,
                    text: "Add",
                    onTap: ()async{
                      Get.to(()=>const EditSpecialityView());

                    },
                  ),
                ),
                const HeightSpacer(50)

              ],
            )

        ),
      ),
    );
  }
}
