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
