import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task/data/repos/task_repo_impl.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/Task_cubit.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../Main/presentation/views/main_view.dart';

class FilterData extends StatefulWidget {
  const FilterData({super.key});

  @override
  State<FilterData> createState() => _FilterDataState();
}

class _FilterDataState extends State<FilterData> {
  String? drobValue;
  String? dateValue;
  String? dateStartValue;
  String? dateEndValue;
  List<String> date = ["Day", "Week", "Month"];
  var selectedSpeciality;
  var selectedCurrency;
  var selectedClient;
  var selectedCountry;
  var selectedFreelancer;
  var selectedShareWith;
  var selectedRole;
  var selectedChannel;
  var selectedStatus;
  var selectedSort;
  var selectedUser;
  String? specialityValue;
  String? currencyValue;
  String? clientValue;
  String? countryValue;
  String? freelancerValue;
  String? shareWithValue;
  String? roleValue;
  String? channelValue;
  String? statusValue;
  String? sortValue;
  String? userValue;

  @override
  Widget build(BuildContext context) {
    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return BlocProvider(
      create: (context) => TaskCubit(TaskRepoImpl())
        ..callUserCubit(context)
        ..callCCurrencyCubit(context)
        ..callSpecialityCubit(context)
        ..callStatusCubit(context)
        ..callClientCubit(context)
        ..callCountryCubit(context)
        ..callFreelancerCubit(context),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) => countryModel == null ||
                currencyModel == null ||
                freelancerModel == null ||
                userModel == null ||
                clientModel == null ||
                statusModel == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(15.h),
                  child: Column(
                    children: [
                      Text(
                        "Filter Tasks ",
                        style: appStyle(
                            context, 22, Colors.black, FontWeight.w900),
                      ),
                      Drop(
                        hintColor: Colors.grey,
                        hintText: "Select Speciality",
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
                      Drop(
                        hintColor: Colors.grey,
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
                      Drop(
                        hintColor: Colors.grey,
                        hintText: "Freelancer",
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
                      Drop(
                        hintColor: Colors.grey,
                        hintText: "Select Client",
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
                      Drop(
                        hintColor: Colors.grey,
                        selectedValue: selectedUser,
                        hintText: 'User',
                        items: userModel!.users
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
                            selectedUser = selected;
                            userValue = selected!.id;
                          });
                        },
                      ),
                      Drop(
                        hintColor: Colors.grey,
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
                      Drop(
                        hintColor: Colors.grey,
                        hintText: 'Sort By',
                        selectedValue: sortValue,
                        items: freelancerSort
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
                            selectedSort = selected;
                            sortValue = selected;
                            // FreelancerCubit.get(context).filterFreelancer(
                            //     sort: sortValue,
                            //     speciality: specialityValue ?? "");
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ToggleSwitch(
                        inactiveBgColor: Colors.white,
                        activeBgColor: const [
                          Colors.blue,
                          Colors.blue,
                          Colors.blue,
                        ],
                        fontSize: 16,
                        dividerColor: Colors.black,
                        cornerRadius: 20,
                        initialLabelIndex: 0,
                        minHeight: 60,
                        minWidth: 100,
                        totalSwitches: 3,
                        labels: date,
                        onToggle: (index) {
                          dateValue = date[index as int];

                          print(date[index]);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
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
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  dateStartValue == null && dateEndValue == null
                                      ? "Choose Range Date"
                                      : "${dateStartValue} - ${dateEndValue}",
                                  style: const TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const HeightSpacer(10),
                      GestureDetector(
                        onTap: () {
                          status1 = statusValue ?? "";
                          speciality = specialityValue ?? "";
                          sort = sortValue ?? "";
                          start = dateStartValue ?? "";
                          end = dateEndValue ?? "";
                          freelancer = freelancerValue ?? "";
                          client = clientValue ?? "";
                          user = userValue ?? "";
                          country = countryValue ?? "";
                          Get.offAll(() => const MainView(
                                x: 2,
                              ));
                        },
                        child: Container(
                          width: 150.w,
                          height: MediaQuery.of(context).size.width > 600
                              ? 40.h
                              : 50.h,
                          padding: EdgeInsets.all(15.h),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20.h)),
                          child: const Text(
                            "Filter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class DropDownFilterItem extends StatelessWidget {
  const DropDownFilterItem({
    super.key,
    this.listValue,
    required this.label,
  });

  final List<String>? listValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    String? dropValue;

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          focusColor: Colors.grey,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      value: dropValue,
      isDense: true,
      hint: Text(label),
      isExpanded: true,
      borderRadius: BorderRadius.circular(20),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      onChanged: (newValue) {
        dropValue = newValue;
      },
      items: listValue?.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
