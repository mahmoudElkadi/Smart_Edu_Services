import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/task%20details.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class TaskDetailsViewBody extends StatefulWidget {
  const TaskDetailsViewBody({super.key});

  @override
  State<TaskDetailsViewBody> createState() => _TaskDetailsViewBodyState();
}

class _TaskDetailsViewBodyState extends State<TaskDetailsViewBody> {
  TextEditingController currencyController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController channelController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController clientOfferController = TextEditingController();
  TextEditingController clientPriceController = TextEditingController();
  TextEditingController freelancerController = TextEditingController();
  TextEditingController suggestedOfferController = TextEditingController();
  TextEditingController freelancerPriceController = TextEditingController();
  TextEditingController profitController = TextEditingController();
  String? dateStartValue;
  String? dateEndValue;
  String? value;

  @override
  void dispose() {
    currencyController.dispose();
    userNameController.dispose();
    userRoleController.dispose();
    titleController.dispose();
    specialityController.dispose();
    channelController.dispose();
    clientController.dispose();
    countryController.dispose();
    clientOfferController.dispose();
    clientPriceController.dispose();
    freelancerController.dispose();
    suggestedOfferController.dispose();
    freelancerPriceController.dispose();
    profitController.dispose();
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
                "Task Details",
                style: appStyle(20, Colors.black, FontWeight.w900),
              ),
            ),
            const HeightSpacer(20),
            Container(
              padding: EdgeInsets.all(15.h),
              width: MediaQuery.of(context).size.width,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border.all(color: Colors.grey, width: 0.7.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "125135",
                    style: appStyle(16, Colors.black, FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.h),
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: color.Colors.blueColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(color: Colors.grey, width: 0.7.w)),
                    child: Text(
                      "delivered",
                      textAlign: TextAlign.center,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete_forever,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(20),
            TaskTextItem(
              title: 'Title',
              hint: 'Title',
              controller: titleController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: 'Speciality',
              hint: 'Specialities',
              controller: specialityController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: 'Channel',
              hint: 'Channel',
              controller: channelController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: 'Client',
              hint: 'Client',
              controller: clientController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: 'Country',
              hint: 'share with',
              controller: countryController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: 'Client Offer',
              hint: '(0-0)',
              controller: clientOfferController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Client Price",
              hint: "Price",
              controller: clientPriceController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Currency",
              hint: "Currency",
              controller: currencyController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Freelancer",
              hint: "FreeLancer",
              controller: freelancerController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Freelancer Price",
              hint: "price",
              controller: freelancerPriceController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Suggested Offer",
              hint: "(0-0)",
              controller: suggestedOfferController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Profit",
              hint: "Profit",
              controller: profitController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "UserName",
              hint: "User name",
              controller: userNameController,
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "User Role",
              hint: "Role",
              controller: userRoleController,
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
              text: "Edit",
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
            const HeightSpacer(25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.Colors.blueColor.withOpacity(0.08),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Status",
                    style: appStyle(18, Colors.black, FontWeight.w500),
                  ),
                  const HeightSpacer(20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.grey,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      value: value,
                      isDense: true,
                      hint: const Text("Status"),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      //padding: EdgeInsets.all(15.h),
                      onChanged: (newValue) {
                        value = newValue;
                      },
                      items: store.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const HeightSpacer(30),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      backGroundColor: Colors.blue,
                      width: MediaQuery.of(context).size.width > 600
                          ? 300.w
                          : 200.w,
                      text: "Change",
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
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
