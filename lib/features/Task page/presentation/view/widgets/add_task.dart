import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_cubit.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_state.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../Main/presentation/views/main_view.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    statusController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  DateTime? dataTime;
  var selectedSpeciality;
  var selectedCurrency;
  var selectedClient;
  var selectedCountry;
  var selectedFreelancer;
  var selectedShareWith;
  var selectedRole;
  var selectedChannel;
  var selectedStatus;
  late String specialityValue;
  late String currencyValue;
  late String clientValue;
  late String countryValue;
  late String freelancerValue;
  late String shareWithValue;
  String? roleValue;
  String? channelValue;
  String? statusValue;

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<DetailsTaskCubit, TaskDetailsState>(
        builder: (context, state) {
      return FutureBuilder(
          future: DetailsTaskCubit.get(context).shareWith,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var customer = snapshot.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0.h),
                  child: SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.offAll(() => const MainView(x: 2));
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 25,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.sizeOf(context).width * 0.24),
                              child: Text(
                                "Add New Task",
                                style: appStyle(
                                    context, 22, Colors.black, FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const HeightSpacer(20),
                            Drop(
                              hintColor: Colors.grey,
                              hintText: "Select Channel",
                              text: 'Channel',
                              selectedValue: selectedChannel,
                              items: DetailsTaskCubit.get(context)
                                  .channel
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedChannel = selected;
                                  channelValue = selected;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            Drop(
                              hintColor: Colors.grey,
                              hintText: "Select Client",
                              text: 'Client',
                              selectedValue: selectedClient,
                              items: clientModel!.clients
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.clientname.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedClient = selected;
                                  clientValue = selected!.id;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            Drop(
                              hintColor: Colors.grey,
                              hintText: "Select Speciality",
                              text: 'Speciality',
                              selectedValue: selectedSpeciality,
                              items: specialityModel!.specialities
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.subSpeciality.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedSpeciality = selected;
                                  specialityValue = selected!.id;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            TaskTextItem(
                              title: "Title",
                              hint: "Title",
                              controller: titleController,
                            ),
                            const HeightSpacer(10),
                            Drop(
                              hintColor: Colors.grey,
                              hintText: "Select shareWith",
                              text: 'Share With',
                              selectedValue: selectedShareWith,
                              items: customer!.users
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.username.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedShareWith = selected;
                                  shareWithValue = selected!.id;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            Drop(
                              hintColor: Colors.grey,
                              text: " Currency",
                              hintText: "Select Currency",
                              selectedValue: selectedCurrency,
                              items: currencyModel!.currencies
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.currencyname.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedCurrency = selected;
                                  currencyValue = selected!.id;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            TaskTextItem(
                              title: "Task Price",
                              hint: "Price",
                              controller: priceController,
                            ),
                            const HeightSpacer(10),
                            Drop(
                              hintColor: Colors.grey,
                              text: " Status",
                              hintText: "Select Status",
                              selectedValue: selectedStatus,
                              items: statusModel!.statuses
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.statusname.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedStatus = selected;
                                  statusValue = selected!.id;
                                });
                              },
                            ),
                            const HeightSpacer(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DeadLine",
                                  style: appStyle(context, 16, Colors.black,
                                      FontWeight.w500),
                                ),
                                const HeightSpacer(10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.h),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: GestureDetector(
                                    onTap: () async {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      ).then((selectedDate) {
                                        // After selecting the date, display the time picker.
                                        if (selectedDate != null) {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((selectedTime) {
                                            // Handle the selected date and time here.
                                            if (selectedTime != null) {
                                              setState(() {
                                                dataTime = DateTime(
                                                  selectedDate.year,
                                                  selectedDate.month,
                                                  selectedDate.day,
                                                  selectedTime.hour,
                                                  selectedTime.minute,
                                                );
                                              });
                                              // You can use the selectedDateTime as needed.
                                            }
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15.h),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dataTime == null
                                                ? "Choose  Date"
                                                : DateFormat('dd-MM-yyyy HH:mm')
                                                    .format(
                                                        dataTime as DateTime),
                                            style: const TextStyle(
                                                color: Colors.black),
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
                                if (formKey.currentState!.validate()) {
                                  DetailsTaskCubit.get(context).addTask(
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      channel: channelValue.toString(),
                                      client: clientValue.toString(),
                                      shareWith: shareWithValue.toString(),
                                      speciality: specialityValue.toString(),
                                      status: statusValue.toString(),
                                      deadline: dataTime.toString(),
                                      taskCurrency: currencyValue.toString(),
                                      paid: priceController.text);
                                }
                              },
                            ),
                            const HeightSpacer(50),
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              throw Exception(snapshot.error);
              return SafeArea(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
