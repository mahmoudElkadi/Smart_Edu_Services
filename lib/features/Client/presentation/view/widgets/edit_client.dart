import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/models/one_client_model.dart';
import '../../manger/client cubit/client_cubit.dart';

class EditClient extends StatefulWidget {
  const EditClient({super.key, required this.oneClientModel});
  final OneClientModel oneClientModel;

  @override
  State<EditClient> createState() => _EditClientState();
}

class _EditClientState extends State<EditClient> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var selectedCurrency;
  var selectedCountry;
  late String currencyValue;
  late String countryValue;

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    ownerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userNameController.text =
        widget.oneClientModel.client!.clientname.toString();
    emailController.text = widget.oneClientModel.client!.website.toString();
    phoneController.text = widget.oneClientModel.client!.phone.toString();
    ownerController.text = widget.oneClientModel.client!.ownerName.toString();
    countryValue = widget.oneClientModel.client?.country?.id as String;
    currencyValue = widget.oneClientModel.client?.currency?.id as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) => Form(
        key: formKey,
        child: Column(
          children: [
            TaskTextItem(
                title: "User Name",
                hint: "User Name",
                controller: userNameController),
            const HeightSpacer(15),
            TaskTextItem(
              title: "Owner",
              hint: "Owner",
              controller: ownerController,
            ),
            const HeightSpacer(15),
            TaskTextItem(
              title: "Email",
              hint: "Email",
              controller: emailController,
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
              hintText:
                  widget.oneClientModel.client?.country?.countryName as String,
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
              text: 'Currency',
              hintText: widget.oneClientModel.client?.currency?.currencyname
                  as String,
              selectedValue: selectedCurrency,
              items: currencyModel!.currencies
                  .map((item) => DropdownMenuItem<dynamic>(
                        value: item,
                        child: Text(
                          item.currencyname.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (selected) {
                setState(() {
                  selectedCurrency = selected;
                  currencyValue = selected!.id;
                });
              },
            ),
            const HeightSpacer(40),
            Align(
              alignment: Alignment.center,
              child: CustomButton2(
                backGroundColor: Colors.blue,
                widget: ClientCubit.get(context).isLoading == false
                    ? Text(
                        "Edit",
                        style: appStyle(
                            context, 16, Colors.white, FontWeight.bold),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    ClientCubit.get(context).loading();
                    ClientCubit.get(context).updateClient(
                      id: widget.oneClientModel.client?.id as String,
                      clientName: userNameController.text,
                      owner: ownerController.text,
                      phone: phoneController.text,
                      website: emailController.text,
                      country: countryValue,
                      currency: currencyValue,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
