import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer(this.size, {super.key});
  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
    );
  }
}
