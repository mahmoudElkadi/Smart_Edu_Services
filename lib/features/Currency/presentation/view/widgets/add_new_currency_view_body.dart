import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import 'edit_currency_view.dart';

class AddNewCurrencyViewBody extends StatefulWidget {
  const AddNewCurrencyViewBody({super.key});

  @override
  State<AddNewCurrencyViewBody> createState() => _AddNewCurrencyViewBodyState();
}

class _AddNewCurrencyViewBodyState extends State<AddNewCurrencyViewBody> {
  TextEditingController currencyPriceController=TextEditingController();
  TextEditingController currencyNameController=TextEditingController();


  @override
  void dispose() {
    currencyNameController.dispose();
    currencyPriceController.dispose();
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
                  child: Text("Add New Currency",
                    style: appStyle(20, Colors.black, FontWeight.w900),
                  ),
                ),
                const HeightSpacer(50),
                TaskTextItem(title: "Currency Name",hint: "Currency Name", controller: currencyNameController,),
                const HeightSpacer(15),
                TaskTextItem(title: "Currency Price",hint: "Currency Name", controller: currencyPriceController,),
                const HeightSpacer(30),


                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    backGroundColor: Colors.blue,
                    width: 200.w,
                    text: "Add",
                    onTap: ()async{
                     Get.to(()=>const EditCurrencyView());

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
