import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/freelancer/presentation/view/widgets/freelancer_item.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../manger/Freelancer cubit/Freelancer_cubit.dart';
import '../../manger/Freelancer cubit/Freelancer_state.dart';
import 'add_new_freelancer.dart';

class SystemFreelancerView extends StatefulWidget {
  const SystemFreelancerView({super.key});

  @override
  State<SystemFreelancerView> createState() => _SystemFreelancerViewState();
}

class _SystemFreelancerViewState extends State<SystemFreelancerView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelancerCubit, FreelancerState>(
      builder: (context, state) => FutureBuilder(
          future: FreelancerCubit.get(context).allFreelancer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              {
                final freelancer = snapshot.data;
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.h),
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Freelancers",
                              style: appStyle(context, 18, Colors.grey.shade700,
                                  FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomIconButton(
                                onTap: () {
                                  Get.to(() => const AddNewFreelancerView());
                                },
                                color: Colors.white,
                                backGroundColor: HexColor("#00E38C"),
                                height: 10,
                                text: 'Add New Freelancer',
                              ),
                            ),
                          ],
                        ),
                        const HeightSpacer(10),
                        Row(
                          children: [
                            Expanded(
                              child: Drop(
                                height: 25,
                                hintText: "Speciality",
                                selectedValue: FreelancerCubit.get(context)
                                    .selectedSpeciality,
                                items: specialityModel!.specialities
                                    .map((item) => DropdownMenuItem<dynamic>(
                                          value: item,
                                          child: Text(
                                            item.subSpeciality.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (selected) {
                                  setState(() {
                                    FreelancerCubit.get(context)
                                        .selectedSpeciality = selected;
                                    FreelancerCubit.get(context)
                                        .specialityValue = selected!.id;
                                    FreelancerCubit.get(context)
                                        .filterFreelancer(
                                            sort: FreelancerCubit.get(context)
                                                    .selectedSort ??
                                                "",
                                            speciality:
                                                FreelancerCubit.get(context)
                                                    .specialityValue);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Drop(
                                height: 25,
                                hintText: 'Sort By',
                                selectedValue:
                                    FreelancerCubit.get(context).sortValue,
                                items: freelancerSort
                                    .map((item) => DropdownMenuItem<dynamic>(
                                          value: item,
                                          child: Text(
                                            item.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (selected) {
                                  setState(() {
                                    FreelancerCubit.get(context).selectedSort =
                                        selected;
                                    FreelancerCubit.get(context).sortValue =
                                        selected;
                                    FreelancerCubit.get(context)
                                        .filterFreelancer(
                                            sort: FreelancerCubit.get(context)
                                                .sortValue,
                                            speciality:
                                                FreelancerCubit.get(context)
                                                        .specialityValue ??
                                                    "");
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const HeightSpacer(10),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return FreelancerItem(
                                  onTap: () {
                                    FreelancerCubit.get(context)
                                        .deleteFreelancer(
                                            id: freelancer.freelancers[index].id
                                                .toString(),
                                            sub: freelancer.freelancers[index]
                                                .freelancername
                                                .toString());
                                  },
                                  freelancer: freelancer.freelancers[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const HeightSpacer(20);
                            },
                            itemCount: freelancer!.freelancers.length)
                      ],
                    ),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return throw Exception(snapshot);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
