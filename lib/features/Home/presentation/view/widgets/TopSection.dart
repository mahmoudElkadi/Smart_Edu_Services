import"package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_style.dart';


class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          padding:  EdgeInsets.all(10.w),
          alignment: Alignment.topCenter,
          height: 250,
        ),
        Container(
          padding:  EdgeInsets.all(10.w),
          alignment: Alignment.topCenter,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.w),
              bottomRight: Radius.circular(40.w)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Text("Overview",
                style: appStyle(22, Colors.white, FontWeight.bold,
                )
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 60.h,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal:30.w ),
            padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w)
            ),
            child: Column(
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                          Text("Task Count",
                         style: appStyle(15, Colors.grey, FontWeight.bold),
                         ),
                         SizedBox(height: 10.h,),
                          Text("20",
                           style:appStyle(18, Colors.black, FontWeight.bold),
                         ),

                       ],
                     ),
                     Column(
                       children: [
                          Text("Completed Count",
                         style: appStyle(15, Colors.grey, FontWeight.bold),
                         ),
                         SizedBox(height: 10.h,),
                          Text("2",
                           style: appStyle(18, Colors.black, FontWeight.bold),
                         ),

                       ],
                     ),
                   ],
                 ),
                 SizedBox(height: 15.h,),
                 Column(
                   children: [
                     Text("Task completion - 90%",
                     style: appStyle(16, Colors.blueAccent, FontWeight.bold),
                     ),
                     SliderTheme(
                       data: SliderTheme.of(context).copyWith(
                           trackHeight: 3,
                           thumbColor: Colors.green,
                           thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                       child: Slider(
                         value: 90,
                         max: 100,
                         min: 0,
                         activeColor: Colors.green,
                         inactiveColor: Colors.grey,
                         onChanged: (double value) {},
                       ),
                     ),
                   ],
                 )
              ],
            ),
          ),
        )
      ],

    );
  }
}
