import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../data/model/details_task_model.dart';
import '../../manger/Details task cubit/details_task_cubit.dart';
import '../../manger/Details task cubit/details_task_state.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({super.key, required this.detailsTaskModel});
  final DetailsTaskModel detailsTaskModel;

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  var selectedSpeciality;
  var selectedCurrency;
  var selectedClient;
  var selectedCountry;
  var selectedFreelancer;
  var selectedRole;
  late String specialityValue;
  late String currencyValue;
  late String clientValue;
  late String countryValue;
  late String freelancerValue;
  String? roleValue;

  @override
  void initState() {
    DetailsTaskCubit.get(context).titleController.text =
        widget.detailsTaskModel.task?.title.toString() ?? "";
    DetailsTaskCubit.get(context).channelController.text =
        widget.detailsTaskModel.task?.channel.toString() ?? "";
    DetailsTaskCubit.get(context).clientPriceController.text =
        widget.detailsTaskModel.task?.cost.toString() ?? "";
    DetailsTaskCubit.get(context).freelancerPriceController.text =
        widget.detailsTaskModel.task?.paid.toString() ?? "";
    freelancerValue =
        widget.detailsTaskModel.task?.freelancer?.id.toString() ?? "";
    countryValue = widget.detailsTaskModel.task?.country?.id.toString() ?? "";
    currencyValue =
        widget.detailsTaskModel.task?.taskCurrency?.id.toString() ?? "";
    specialityValue =
        widget.detailsTaskModel.task?.speciality?.id.toString() ?? "";
    clientValue = widget.detailsTaskModel.task?.client?.id.toString() ?? "";
  }

  DateTime? dataTime;
  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<DetailsTaskCubit, TaskDetailsState>(
        builder: (context, state) {
      return Form(
        child: Column(
          children: [
            TaskTextItem(
              title: 'Title',
              hint: 'Title',
              controller: DetailsTaskCubit.get(context).titleController,
            ),
            const HeightSpacer(10),
            Drop(
              hintText:
                  widget.detailsTaskModel.task?.speciality?.subSpeciality ??
                      "Select Speciality",
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
              title: 'Channel',
              hint: 'Channel',
              controller: DetailsTaskCubit.get(context).channelController,
            ),
            const HeightSpacer(10),
            Drop(
              hintText:
                  widget.detailsTaskModel.task?.client?.clientname.toString() ??
                      "Select Client",
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
              text: widget.detailsTaskModel.task?.country?.countryName
                      .toString() ??
                  "Select Country",
              selectedValue: selectedCountry,
              hintText: 'Country',
              items: countryModel!.countries
                  .map((item) => DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item.countryName.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (selected) {
                setState(() {
                  selectedCountry = selected;
                  countryValue = selected!.id;
                });
              },
            ),
            const HeightSpacer(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Client Offer",
                  style: appStyle(context, 16, Colors.black, FontWeight.w500),
                ),
                const HeightSpacer(10),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "(${widget.detailsTaskModel.offer?.customerOfferMax ?? 0.toString()}-${widget.detailsTaskModel.offer?.customerOfferMin ?? 0.toString()})",
                    style: appStyle(context, 16, Colors.black, FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Client Price",
              hint: "Price",
              controller: DetailsTaskCubit.get(context).clientPriceController,
            ),
            const HeightSpacer(10),
            Drop(
              text: " Currency",
              hintText: widget.detailsTaskModel.task?.taskCurrency?.currencyname
                      .toString() ??
                  "Select Currency",
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
            Drop(
              text: 'Freelancer',
              hintText: widget.detailsTaskModel.task?.freelancer?.freelancername
                      .toString() ??
                  "Freelancer",
              selectedValue: selectedFreelancer,
              items: freelancerModel!.freelancers
                  .map((item) => DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item.freelancername.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (selected) {
                setState(() {
                  selectedFreelancer = selected;
                  freelancerValue = selected!.id;
                });
              },
            ),
            const HeightSpacer(10),
            TaskTextItem(
              title: "Freelancer Price",
              hint: "price",
              controller:
                  DetailsTaskCubit.get(context).freelancerPriceController,
            ),
            const HeightSpacer(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suggested Offer",
                  style: appStyle(context, 16, Colors.black, FontWeight.w500),
                ),
                const HeightSpacer(10),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "(${widget.detailsTaskModel.offer?.specialistOfferMax ?? 0.toString()}-${widget.detailsTaskModel.offer?.specialistOfferMin ?? 0.toString()})",
                    style: appStyle(context, 16, Colors.black, FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HeightSpacer(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DeadLine",
                  style: appStyle(context, 16, Colors.black, FontWeight.w500),
                ),
                const HeightSpacer(10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(color: Colors.black, width: 1)),
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
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dataTime == null &&
                                    widget.detailsTaskModel.task?.deadline !=
                                        null
                                ? DateFormat('dd-MM-yyyy HH:mm').format(widget
                                    .detailsTaskModel
                                    .task
                                    ?.deadline as DateTime)
                                : widget.detailsTaskModel.task?.deadline == null
                                    ? "Choose  Date"
                                    : DateFormat('dd-MM-yyyy HH:mm')
                                        .format(dataTime as DateTime),
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
              controller: DetailsTaskCubit.get(context).descriptionController,
              keyboardType: TextInputType.text,
              color: Colors.white,
              label: "Description",
              maxLines: 4,
            ),
            const HeightSpacer(20),
            Align(
              alignment: Alignment.center,
              child: CustomButton2(
                backGroundColor: Colors.blue,
                widget: DetailsTaskCubit.get(context).isLoading == false
                    ? Text(
                        "Edit",
                        style: appStyle(
                            context, 18, Colors.white, FontWeight.bold),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                onTap: () async {
                  DetailsTaskCubit.get(context).updateTask(
                      id: widget.detailsTaskModel.task!.id.toString(),
                      title: DetailsTaskCubit.get(context).titleController.text,
                      description: DetailsTaskCubit.get(context)
                          .descriptionController
                          .text,
                      channel:
                          DetailsTaskCubit.get(context).channelController.text,
                      client: clientValue,
                      freelancer: freelancerValue,
                      speciality: specialityValue,
                      taskStatus: "64fdd3f2a86587827152ab36",
                      deadline: dataTime.toString(),
                      createdBy: freelancerValue,
                      acceptedBy: freelancerValue,
                      taskCurrency: currencyValue,
                      paid: DetailsTaskCubit.get(context)
                          .freelancerPriceController
                          .text,
                      cost: DetailsTaskCubit.get(context)
                          .clientPriceController
                          .text,
                      profitAmount: "32326");
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
