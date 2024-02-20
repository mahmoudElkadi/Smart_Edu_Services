import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Main/presentation/views/main_view.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../manger/user cubit/user_state.dart';

class AddNewUserViewBody extends StatefulWidget {
  const AddNewUserViewBody({super.key});

  @override
  State<AddNewUserViewBody> createState() => _AddNewUserViewBodyState();
}

class _AddNewUserViewBodyState extends State<AddNewUserViewBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? dateStartValue;
  String? dateEndValue;

  var selectedCountry;
  var selectedRole;

  late String countryValue;
  String? roleValue;

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.offAll(() => const MainView(
                              x: 1,
                            ));
                      },
                      child: const Icon(Icons.arrow_back)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.24),
                    child: Text(
                      "Add New User",
                      style:
                          appStyle(context, 20, Colors.black, FontWeight.w900),
                    ),
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const HeightSpacer(20),
                    TaskTextItem(
                      title: "Full Name",
                      hint: "Enter Your Name",
                      controller: fullNameController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "User Name",
                      hint: "User Name",
                      controller: userNameController,
                    ),
                    const HeightSpacer(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: appStyle(
                              context, 16, Colors.black, FontWeight.w500),
                        ),
                        const HeightSpacer(10),
                        CustomTextField(
                          controller: passwordController,
                          label: "Password",
                          color: Colors.transparent,
                          keyboardType: TextInputType.text,
                          obscureText: UserCubit.get(context).obscureText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                UserCubit.get(context).obscureText =
                                    !UserCubit.get(context).obscureText;
                              });
                            },
                            child: UserCubit.get(context).obscureText == false
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password must not be Empty';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Phone",
                      hint: "Phone",
                      controller: phoneController,
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'Country',
                      selectedValue: selectedCountry,
                      hintText: 'Select Country',
                      items: countryModel!.countries
                          .map((item) => DropdownMenuItem<dynamic>(
                                value: item,
                                child: Text(
                                  item.countryName.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedCountry = selected;
                          countryValue = selected!.id;
                        });
                      },
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'User Role',
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
                        });
                      },
                    ),
                    const HeightSpacer(15),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton2(
                        backGroundColor: Colors.blue,
                        widget: UserCubit.get(context).isLoading == false
                            ? Text(
                                "Edit",
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.bold),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                        onTap: () async {
                          if (roleValue == null || countryValue == null) {
                            Get.snackbar("Please Complete All Fields!", "",
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.only(top: 25.h),
                                icon: const Icon(Icons.warning_amber));
                          } else if (formKey.currentState!.validate()) {
                            UserCubit.get(context).createUser(
                                fullName: fullNameController.text,
                                userName: userNameController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                userType: roleValue!,
                                country: countryValue,
                                userRole: roleValue!);
                          }
                        },
                      ),
                    ),
                    const HeightSpacer(50),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
