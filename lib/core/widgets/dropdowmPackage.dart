import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterDropdownSearch extends StatefulWidget {
  final TextEditingController? textController;
  final String? hintText;
  final List<String>? items;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final IconData? suffixIcon;
  final double? dropdownHeight;
  final Color? dropdownBgColor;
  final InputBorder? textFieldBorder;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;

  const FlutterDropdownSearch(
      {super.key,
      required this.textController,
      this.hintText,
      required this.items,
      this.hintStyle,
      this.style,
      this.dropdownTextStyle,
      this.suffixIcon,
      this.dropdownHeight,
      this.dropdownBgColor,
      this.textFieldBorder,
      this.contentPadding,
      this.labelText});

  @override
  State<FlutterDropdownSearch> createState() => _FlutterDropdownSearchState();
}

class _FlutterDropdownSearchState extends State<FlutterDropdownSearch> {
  bool _isTapped = false;
  List<String> _filteredList = [];
  List<String> _subFilteredList = [];

  @override
  initState() {
    _filteredList = widget.items!;
    _subFilteredList = _filteredList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Text Field
        TextFormField(
          controller: widget.textController,
          onChanged: (val) {
            setState(() {
              _filteredList = _subFilteredList
                  .where((element) => element
                      .toLowerCase()
                      .contains(widget.textController!.text.toLowerCase()))
                  .toList();
            });
          },
          validator: (val) => val!.isEmpty ? 'Field can\'t empty' : null,
          style: widget.style ??
              TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
          onTap: () => setState(() => _isTapped = true),
          decoration: InputDecoration(
              labelText: widget.labelText,
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(10.h)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.circular(10.h)),
              border: widget.textFieldBorder ?? const UnderlineInputBorder(),
              hintText: widget.hintText ?? "Write here...",
              hintStyle: widget.hintStyle ??
                  const TextStyle(fontSize: 16.0, color: Colors.grey),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped = !_isTapped;
                    });
                  },
                  child: Icon(
                      _isTapped == false
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up_outlined,
                      size: 25)),
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              isDense: true,
              suffixIconConstraints:
                  BoxConstraints.loose(MediaQuery.of(context).size),
              suffix: InkWell(
                  onTap: () {
                    widget.textController?.text = '';
                    setState(() => _filteredList = widget.items!);
                  },
                  child: const Icon(Icons.close, size: 20))),
        ),

        ///Dropdown Items
        _isTapped && _filteredList.isNotEmpty
            ? Container(
                height: widget.textController?.text != '' ? 40.h : 180.h,
                decoration: BoxDecoration(
                    color: widget.dropdownBgColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() => _isTapped = !_isTapped);
                        widget.textController!.text = _filteredList[index];
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(_filteredList[index],
                            style: widget.dropdownTextStyle ??
                                TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16.0)),
                      ),
                    );
                  },
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
