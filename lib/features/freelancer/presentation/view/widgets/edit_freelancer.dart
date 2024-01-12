import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/dropdown_item.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';

class EditFreelancer extends StatefulWidget {
  const EditFreelancer({super.key});

  @override
  State<EditFreelancer> createState() => _EditFreelancerState();
}

class _EditFreelancerState extends State<EditFreelancer> {
  TextEditingController emailController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    userNameController.text="hajj";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TaskTextItem(title: "User Name",hint: "User Name", controller: userNameController),
          const HeightSpacer(15),
          TaskTextItem(title: "Email",hint: "Email", controller: emailController,),
          const HeightSpacer(15),
          TaskTextItem(title: "Phone",hint: "Phone", controller: phoneController,),
          const HeightSpacer(15),
          TaskDropdownItem(title: 'Country', hint: 'Country',value: value2, drobDown: store,onChanged: (newValue){
            value2=newValue;
            Get.snackbar("value2",value2!);
            print(value2);
          },),
          const HeightSpacer(15),
          TaskDropdownItem(title: 'Currency', hint: 'Currency',value: value, drobDown: store,onChanged: (newValue){
            value=newValue;
            print(value);
          },),
          const HeightSpacer(15),
          TaskDropdownItem(title: 'Speciality', hint: 'Specialities', drobDown: store,),
          const HeightSpacer(40),

          Align(
            alignment: Alignment.center,
            child: CustomButton(
              backGroundColor: Colors.blue,
              width: 200.w,
              text: "Edit",
              onTap: ()async{
                print('value');
                Get.snackbar("value22",value2!);

              },
            ),
          ),
        ],
      ),
    );
  }
}
