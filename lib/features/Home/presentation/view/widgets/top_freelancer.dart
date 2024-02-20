import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../data/transaction.dart';

class TopFreelancer extends StatelessWidget {
  const TopFreelancer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w, bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Top 5 Freelancer ",
            style: appStyle(context, 22, Colors.black, FontWeight.w500),
          ),
          const HeightSpacer(25),
          Container(
            height: 380.h,
            margin: EdgeInsets.only(bottom: 10.h, right: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/book.png",
                              fit: BoxFit.cover,
                              width: 40.h,
                              height: 40.h,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mahmoud Elkady",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Text(
                              "Level Of Exp : Expert ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(FontAwesomeIcons.whatsapp)
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Container(
                    width: double.infinity,
                    height: 0,
                    color: Colors.black26,
                  ),
                );
              },
              itemCount: quickDetails().length,
            ),
          ),
          const HeightSpacer(20),
          Text(
            "Add New Freelancer  >",
            style:
                appStyle(context, 18, color.Colors.blueColor, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
