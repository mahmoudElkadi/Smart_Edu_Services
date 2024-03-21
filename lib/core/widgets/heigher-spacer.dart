import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer(this.size, {super.key});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
    );
  }
}
