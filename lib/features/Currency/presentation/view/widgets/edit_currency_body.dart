import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/dropdown_item.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';

class EditCurrencyViewBody extends StatefulWidget {
  const EditCurrencyViewBody({super.key});

  @override
  State<EditCurrencyViewBody> createState() => _EditCurrencyViewBodyState();
}

class _EditCurrencyViewBodyState extends State<EditCurrencyViewBody> {
  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
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
                  child: Text("Currency Details",
                    style: appStyle(20, Colors.black, FontWeight.w900),
                  ),
                ),
                const HeightSpacer(50),
                TaskTextItem(title: "Name",hint: "Currency Name", controller: nameController,),
                const HeightSpacer(15),
                TaskTextItem(title: "Price",hint: "Currency Price", controller: priceController,),
                const HeightSpacer(15),
                TaskDropdownItem(title: 'Expired', hint: 'False', drobDown: store,),

                const HeightSpacer(30),


                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    backGroundColor: Colors.blue,
                    width: 200.w,
                    text: "Edit",
                    onTap: ()async{

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
