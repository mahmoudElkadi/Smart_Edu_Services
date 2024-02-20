import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/utils/app_style.dart';

class QuickDetails extends StatefulWidget {
  const QuickDetails({super.key});

  @override
  State<QuickDetails> createState() => _QuickDetailsState();
}

class _QuickDetailsState extends State<QuickDetails> {
  List<OrdinalData> ordinalDataList = [
    OrdinalData(domain: 'Programming', measure: 3, color: Colors.blue[300]),
    OrdinalData(domain: 'Medical', measure: 5, color: Colors.amber[300]),
    OrdinalData(domain: 'Office', measure: 9, color: Colors.purple[300]),
    OrdinalData(
        domain: 'Business Management', measure: 6.5, color: Colors.pink[300]),
  ];
  double sum = 0;
  List per = [];
  void culcMeasure() {
    for (int i = 0; i < ordinalDataList.length; i++) {
      per.add(ordinalDataList[i].measure);
    }
  }

  @override
  void initState() {
    culcMeasure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w, bottom: 15),
      height: 470.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "Tasks Breakdown by Specialities",
              style: appStyle(context, 18, Colors.black, FontWeight.w500),
            ),
          ),
          const HeightSpacer(30),
          Center(
            child: SizedBox(
              width: 180.w,
              height: 200.h,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPieO(
                  data: ordinalDataList,
                  configRenderPie: const ConfigRenderPie(arcWidth: 10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 170.h,
            child: ListView.builder(
              itemCount: ordinalDataList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 26.w,
                              height: 26.h,
                              decoration: BoxDecoration(
                                color: ordinalDataList[index].color,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              ordinalDataList[index].domain,
                              style: appStyle(
                                  context, 14, Colors.black, FontWeight.w500),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Text(
                            per[index].toString(),
                            style: appStyle(
                                context, 16, Colors.black, FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const HeightSpacer(20),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
