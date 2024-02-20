import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import "package:smart/core/utils/colors.dart" as color;
import 'package:smart/core/widgets/heigher-spacer.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Freelancer",
            style: appStyle(context, 22, Colors.black, FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          const HeightSpacer(30),
          Text(
            "65",
            style: appStyle(context, 22, Colors.black, FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          const HeightSpacer(15),
          Row(
            children: [
              Text(
                "1.8%",
                style: appStyle(
                    context, 18, color.Colors.blueColor, FontWeight.w500),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.arrow_upward_sharp,
                color: color.Colors.blueColor,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "than last month",
                style: appStyle(context, 14, Colors.black, FontWeight.w300),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const HeightSpacer(10),
          Container(
            height: 120.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: LineChart(LineChartData(
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 10,
                backgroundColor: Colors.white,
                lineBarsData: [
                  LineChartBarData(
                      spots: [
                        const FlSpot(0, 4),
                        const FlSpot(1, 6),
                        const FlSpot(2, 8),
                        const FlSpot(3, 6.2),
                        const FlSpot(4, 7),
                        const FlSpot(5, 4),
                        const FlSpot(6, 8),
                        const FlSpot(7, 9),
                        const FlSpot(8, 8),
                        const FlSpot(9, 7.5),
                        const FlSpot(10, 9.5),
                      ],
                      isCurved: true,
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent]),
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.2),
                          Colors.blueAccent.withOpacity(0.2)
                        ]),
                      ),
                      dotData: FlDotData(
                        show: false,
                      ))
                ],
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: false,
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                          color: Colors.grey.shade300, strokeWidth: 0.5);
                    }),
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false))),
          ),
        ],
      ),
    );
  }
}
