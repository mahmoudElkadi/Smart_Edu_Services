import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    userRoleController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: userNameController,
            keyboardType: TextInputType.name,
            label: "User Name",
            prefixIcon: const Icon(Icons.person),
            color: Colors.white,
          ),
          const HeightSpacer(15),
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            label: "Email",
            prefixIcon: const Icon(Icons.email),
            color: Colors.white,
          ),
          const HeightSpacer(15),
          CustomTextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            label: "Phone",
            prefixIcon: const Icon(Icons.phone),
            color: Colors.white,
          ),
          const HeightSpacer(15),
          CustomTextField(
            controller: userRoleController,
            keyboardType: TextInputType.name,
            label: "User Role",
            prefixIcon: const Icon(Symbols.pen_size_4),
            color: Colors.white,
          ),
          const HeightSpacer(15),
          CustomTextField(
            controller: countryController,
            keyboardType: TextInputType.name,
            label: "Country",
            prefixIcon: const Icon(Icons.flag),
            color: Colors.white,
          ),
          const HeightSpacer(30),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              backGroundColor: Colors.blue,
              width: 200.w,
              text: "Edit",
              onTap: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
