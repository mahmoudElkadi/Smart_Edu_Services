import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../utils/app_style.dart';
import '../utils/constant.dart';
import 'dropdowmPackage.dart';

class DropdownItem extends StatelessWidget {
  const DropdownItem(
      {super.key,
      required this.searchController,
      required this.items,
      required this.hintText,
      required this.label});
  final TextEditingController searchController;
  final List<String> items;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: appStyle(context, 18, Colors.black, FontWeight.w600)),
        FlutterDropdownSearch(
          items: specialityList.map((obj) => obj.name).toList(),
          textController: searchController,
          hintText: hintText,
          textFieldBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(10.h)),
        ),
      ],
    );
  }
}

class Drop extends StatefulWidget {
  const Drop({
    super.key,
    required this.items,
    this.onChanged,
    this.selectedValue,
    this.text,
    required this.hintText,
    this.border,
    this.height,
    this.hintColor,
  });
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic str)? onChanged;
  final dynamic selectedValue;
  final String? text;
  final String hintText;
  final double? border;
  final double? height;
  final Color? hintColor;

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.text != null
            ? Text(
                widget.text!,
                style: appStyle(context, 16, Colors.black, FontWeight.w500),
              )
            : Container(
                height: 0,
              ),
        const HeightSpacer(10),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.black, width: widget.border ?? 0.8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                isExpanded: true,
                hint: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.hintColor ?? Colors.black,
                  ),
                ),
                items: widget.items,
                value: widget.selectedValue,
                onChanged: widget.onChanged,
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: widget.height ?? 40,
                  width: 200,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// (selected) {
// setState(() {
// selectedValue = selected;
// String? selectedId = selected!.id;
// Get.snackbar('$selectedId', '');
// });
// }
