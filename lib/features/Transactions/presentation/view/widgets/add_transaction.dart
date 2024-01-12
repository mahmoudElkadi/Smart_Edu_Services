import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../Task page/presentation/view/widgets/dropdown_item.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';

class AddTransactionViewBody extends StatefulWidget {
  const AddTransactionViewBody({super.key});

  @override
  State<AddTransactionViewBody> createState() => _AddTransactionViewBodyState();
}

class _AddTransactionViewBodyState extends State<AddTransactionViewBody> {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    accountNumController.dispose();

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
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add New Transaction",
                style: appStyle(20, Colors.black, FontWeight.w900),
              ),
            ),
            const HeightSpacer(20),
            TaskTextItem(
              title: "Amount",
              hint: "Amount",
              controller: amountController,
            ),
            const HeightSpacer(15),
            TaskDropdownItem(
              title: 'Methods',
              hint: 'Methods',
              drobDown: store,
            ),
            const HeightSpacer(15),
            TaskTextItem(
              title: "Account Number",
              hint: "Account Number",
              controller: accountNumController,
            ),
            const HeightSpacer(15),
            TaskDropdownItem(
              title: 'Account',
              hint: 'Account',
              drobDown: store,
            ),
            const HeightSpacer(15),
            const HeightSpacer(30),
            CustomButton(
              backGroundColor: Colors.blue,
              width: 200.w,
              text: "Add Transaction",
              onTap: () async {
                // Get.to(()=>const TransactionDetials());
                // Get.to(()=>MainView());
                // if(formKey.currentState!.validate()){
                //   LoginModel model = LoginModel(
                //       email: LoginCubit.get(context).email.text,
                //       password: LoginCubit.get(context).password.text);
                //   await LoginCubit.get(context).userLogin(model);
                // }
              },
            ),
            const HeightSpacer(50)
          ],
        )),
      ),
    );
  }
}
