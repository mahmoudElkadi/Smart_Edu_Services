import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart/core/Network/shared.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/features/Login/data/repos/login_repo_impl.dart';
import 'package:smart/features/Login/presentation/manger/login%20cubit/login_state.dart';
import 'package:smart/features/Login/presentation/view/widgets/forget_password.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../data/model/login_request.dart';
import '../../manger/login cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "UserName",
                  color: Colors.white,
                  controller: name,
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'User Name must not be Empty';
                    }
                    return null;
                  },
                ),
                const HeightSpacer(20),
                CustomTextField(
                  controller: password,
                  label: "Password",
                  color: Colors.white,
                  keyboardType: TextInputType.text,
                  obscureText: LoginCubit.get(context).obscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      LoginCubit.get(context).obscureText =
                          !LoginCubit.get(context).obscureText;
                    },
                    child: LoginCubit.get(context).obscureText == false
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
                const HeightSpacer(15),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgetScreen());
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                  ),
                ),
                const HeightSpacer(15),
                CustomButton2(
                  backGroundColor: Colors.blue,
                  widget: LoginCubit.get(context).isLoading == false
                      ? Text(
                          "Login",
                          style: appStyle(
                              context, 16, Colors.white, FontWeight.bold),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).loading();
                      LoginReqModel model = LoginReqModel(
                          userName: name.text, password: password.text);
                      await LoginCubit.get(context).userLogin(model);
                    }
                    Get.snackbar(CacheHelper.getData(key: "userId"), "message");
                  },
                ),
              ],
            )),
      ),
    );
  }
}
