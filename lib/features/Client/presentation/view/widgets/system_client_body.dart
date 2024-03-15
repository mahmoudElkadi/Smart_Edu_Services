import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_state.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import 'add_new_client.dart';
import 'client_item.dart';

class SystemClientBody extends StatefulWidget {
  const SystemClientBody({super.key});

  @override
  State<SystemClientBody> createState() => _SystemClientBodyState();
}

class _SystemClientBodyState extends State<SystemClientBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) => FutureBuilder(
          future: ClientCubit.get(context).allClient,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              {
                final client = snapshot.data;
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
                              "System Clients",
                              style: appStyle(context, 20, Colors.grey.shade700,
                                  FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomIconButton(
                                onTap: () {
                                  Get.to(() => const AddNewClientView());
                                },
                                height: 15,
                                color: Colors.white,
                                backGroundColor: HexColor("#00E38C"),
                                text: 'Add New Client',
                              ),
                            ),
                          ],
                        ),
                        const HeightSpacer(20),
                        Row(
                          children: [
                            Expanded(
                              child: Drop(
                                height: 30,
                                hintText: "Country",
                                selectedValue:
                                    ClientCubit.get(context).selectedCountry,
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
                                    ClientCubit.get(context).selectedCountry =
                                        selected;
                                    ClientCubit.get(context).countryValue =
                                        selected!.id;
                                    ClientCubit.get(context).filterClient(
                                        sort: ClientCubit.get(context)
                                                .selectedSort ??
                                            "",
                                        country: ClientCubit.get(context)
                                            .countryValue);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Drop(
                                height: 30,
                                hintText: 'Sort By',
                                selectedValue:
                                    ClientCubit.get(context).sortValue,
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
                                    ClientCubit.get(context).selectedSort =
                                        selected;
                                    ClientCubit.get(context).sortValue =
                                        selected;
                                    ClientCubit.get(context).filterClient(
                                        sort:
                                            ClientCubit.get(context).sortValue,
                                        country: ClientCubit.get(context)
                                                .countryValue ??
                                            "");
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const HeightSpacer(20),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ClientItem(
                                client: client.clients[index],
                                onTap: () {
                                  ClientCubit.get(context).deleteClient(
                                      id: client.clients[index].id.toString(),
                                      sub: client.clients[index].clientname
                                          .toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const HeightSpacer(20);
                            },
                            itemCount: client!.clients.length),
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
