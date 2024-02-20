import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_state.dart';
import 'package:smart/features/Users/presentation/view/widgets/user_detials.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import 'add_new_user.dart';

class SystemUserView extends StatefulWidget {
  const SystemUserView({super.key});

  @override
  State<SystemUserView> createState() => _SystemUserViewState();
}

class _SystemUserViewState extends State<SystemUserView> {
  var selectedSort;
  var selectedRole;

  String? sortValue;
  String? roleValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) => FutureBuilder(
          future: UserCubit.get(context).allUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;
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
                            "Team Members",
                            style: appStyle(
                                context, 20, Colors.grey, FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomIconButton(
                              onTap: () {
                                Get.to(() => const AddNewUserView());
                              },
                              color: Colors.white,
                              backGroundColor: HexColor("#00E38C"),
                              text: 'Add New User',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Drop(
                              height: 25,
                              selectedValue: roleValue,
                              hintText: 'Select User Role',
                              items: UserCubit.get(context)
                                  .userRole
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
                                  selectedRole = selected;
                                  roleValue = selected;
                                  UserCubit.get(context).filterUser(
                                      sort: sortValue ?? "", role: roleValue);
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
                              selectedValue: sortValue,
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
                                  selectedSort = selected;
                                  sortValue = selected;
                                  UserCubit.get(context).filterUser(
                                      sort: sortValue, role: roleValue ?? "");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(10),
                      const HeightSpacer(20),
                      ListView.separated(
                        itemCount: user!.users.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(() => UserDetialsView(
                                id: user.users[index].id.toString()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
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
                                          width: 25.h,
                                          height: 25.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.w,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.33,
                                      child: Text(
                                        user.users[index].username.toString(),
                                        style: appStyle(context, 14,
                                            Colors.black, FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10.h),
                                    decoration: BoxDecoration(
                                      color: color.Colors.blueColor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.h),
                                    ),
                                    child: Text(
                                      user.users[index].userRole.toString(),
                                      textAlign: TextAlign.center,
                                      style: appStyle(
                                          context,
                                          14,
                                          color.Colors.blueColor,
                                          FontWeight.w400),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    UserCubit.get(context).deleteUser(
                                        id: user.users[index].id.toString(),
                                        sub: user.users[index].username
                                            .toString());
                                  },
                                  child: const Icon(
                                    Icons.delete_forever,
                                    size: 35,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (c, i) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 10.h,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      const HeightSpacer(20)
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return throw Exception(snapshot.error);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
