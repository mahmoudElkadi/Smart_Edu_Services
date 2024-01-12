import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/Task/presenatation/view/widgets/Filter_ata.dart';

import '../../../../../core/widgets/heigher-spacer.dart';

class FilterTaskTable extends StatelessWidget {
  const FilterTaskTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.width > 600
                                  ? 170.h
                                  : 680.h,
                              color: Colors.white,
                              child: const FilterData()),
                          GestureDetector(
                            onTap: () {
                              print("sss");
                              Navigator.pop(context);
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
                          const HeightSpacer(20)
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.filter_alt_outlined,
          color: Colors.white,
        ));
  }
}
