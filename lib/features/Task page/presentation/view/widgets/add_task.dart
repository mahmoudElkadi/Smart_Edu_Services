import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/dropdown_item.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/task%20details.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  TextEditingController currencyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? dateStartValue;
  String? dateEndValue;

  @override
  void dispose() {
    currencyController.dispose();
    priceController.dispose();
    statusController.dispose();
    descriptionController.dispose();
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
                "Add New Task",
                style: appStyle(20, Colors.black, FontWeight.w900),
              ),
            ),
            const HeightSpacer(20),
            TaskDropdownItem(
              title: 'Client',
              hint: 'Client',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskDropdownItem(
              title: 'Speciality',
              hint: 'Specialities',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskDropdownItem(
              title: 'Title',
              hint: 'Title',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskDropdownItem(
              title: 'Share With',
              hint: 'share with',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskDropdownItem(
              title: 'Channel',
              hint: 'Channel',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskDropdownItem(
              title: 'Priority',
              hint: 'Client',
              drobDown: store,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Currency",
              hint: "Currency",
              controller: currencyController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Task Price",
              hint: "Price",
              controller: priceController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Status",
              hint: "Status",
              controller: statusController,
            ),
            const HeightSpacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DeadLine",
                  style: appStyle(16, Colors.black, FontWeight.w500),
                ),
                Container(
                  // padding: EdgeInsets.all(15.h),
                  width:
                      MediaQuery.of(context).size.width > 600 ? 600.w : 250.w,

                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: GestureDetector(
                    onTap: () async {
                      final DateTimeRange? dataTimeRange =
                          await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2050));
                      if (dataTimeRange != null) {
                        setState(() {
                          selectedDates = dataTimeRange;
                          dateEndValue = DateFormat('yyyy-MM-dd')
                              .format(selectedDates.end);
                          dateStartValue = DateFormat('yyyy-MM-dd')
                              .format(selectedDates.start);
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateStartValue == null && dateEndValue == null
                                ? "Choose Range Date"
                                : "$dateStartValue - $dateEndValue",
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpacer(10),
            const HeightSpacer(10),
            CustomTextField(
              width: double.infinity,
              controller: descriptionController,
              keyboardType: TextInputType.text,
              color: Colors.white,
              label: "Description",
              maxLines: 4,
            ),
            const HeightSpacer(20),
            CustomButton(
              backGroundColor: Colors.blue,
              width: 200.w,
              text: "Add Task",
              onTap: () async {
                Get.to(() => const TaskDetials());
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
