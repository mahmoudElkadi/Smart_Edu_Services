import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../../core/utils/constatnt.dart';

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

  @override
  Widget build(BuildContext context) {
    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.h),
            width: double.infinity,
            child: Text(
              "Filter Tasks ",
              style: appStyle(22, Colors.black, FontWeight.w900),
            ),
          ),
          DropDownFilterItem(
            label: 'Specialities',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Status',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Freelancers',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Client',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Users',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Countries',
            listValue: store,
          ),
          DropDownFilterItem(
            label: 'Sort',
            listValue: store,
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
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: GestureDetector(
              onTap: () async {
                final DateTimeRange? dataTimeRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050));
                if (dataTimeRange != null) {
                  setState(() {
                    selectedDates = dataTimeRange;
                    dateEndValue =
                        DateFormat('yyyy-MM-dd').format(selectedDates.end);
                    dateStartValue =
                        DateFormat('yyyy-MM-dd').format(selectedDates.start);
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
        ],
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
