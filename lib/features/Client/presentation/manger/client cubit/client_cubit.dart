import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_state.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_cubit.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';
import '../../../data/models/client_model.dart';
import '../../../data/models/one_client_model.dart';
import '../../../data/repo/client_repo.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit(this.clientRepo) : super(ClientInitial());

  static ClientCubit get(context) => BlocProvider.of(context);

  ClientRepo clientRepo;

  var selectedCountry;
  var selectedSort;
  String? countryValue;
  String? sortValue;

  TextEditingController subClientController = TextEditingController();
  TextEditingController ClientController = TextEditingController();

  TextEditingController editSubClientController = TextEditingController();
  TextEditingController editClientController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Future<void> close() async {
    subClientController.dispose();
    ClientController.dispose();
    editSubClientController.dispose();
    editClientController.dispose();

    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();

    super.close();
  }

  late Future<OneClientModel> oneClient;

  getOneClient(String id) {
    try {
      emit(GetOneClientLoading());
      oneClient = clientRepo.detailsClient(id);
      emit(GetOneClientSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Client Details Error");
    }
  }

  late Future<ClientModel> allClient;
  getClient() async {
    try {
      emit(GetClientLoading());

      allClient = clientRepo.allClient();
      clientModel = await clientRepo.allClient();

      emit(GetClientSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Client Error");
    }
  }

  filterClient({String? sort, String? country}) {
    try {
      emit(FilterClientLoading());
      allClient = clientRepo.filterClient(sort: sort, country: country);
      emit(FilterClientSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Client Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createClient({
    required String clientName,
    required String owner,
    required String phone,
    required String website,
    required String country,
    required String currency,
  }) {
    emit(AddClientLoading());
    isLoading = true;
    clientRepo
        .createClient(clientName, owner, phone, website, country, currency)
        .then((response) {
      if (response == 0) {
        subClientController.clear();
        ClientController.clear();
        isLoading = false;
        Get.snackbar("Client has been added successfully", "",
            padding: EdgeInsets.only(top: 30.h),
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getClient();
      } else if (response == 1) {
        subClientController.clear();
        ClientController.clear();
        isLoading = false;
        Get.snackbar(
          "Client already exist!",
          "",
          padding: EdgeInsets.only(top: 30.h),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
        emit(AddClientSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  changeState() {
    emit(ChangeState());
  }

  updateClient({
    required String id,
    required String clientName,
    required String owner,
    required String phone,
    required String website,
    required String country,
    required String currency,
  }) {
    emit(AddClientLoading());
    isLoading = true;
    clientRepo
        .updateClient(id, clientName, owner, phone, website, country, currency)
        .then((response) {
      if (response == 0) {
        Get.snackbar("Updated Client", "Client has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;

        emit(AddClientSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Client Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddClientSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  deleteClient({
    required String id,
    required String sub,
  }) {
    emit(DeleteClientLoading());
    isLoading = true;
    clientRepo.deleteClient(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Client", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getClient();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Client Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ));
        getClient();
        emit(DeleteClientSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    emit(ObscureText());
  }

  void callSpecialityCubit(BuildContext context) async {
    final specialityCubit = context.read<SpecialityCubit>();
    await specialityCubit.getSpeciality();
    emit(ClientSuccessSpeciality());
    // Call the function
  }

  void callCountryCubit(BuildContext context) async {
    final countryCubit = context.read<CountryCubit>();
    await countryCubit.getCountry();
    emit(ClientSuccessCountry());

    // Call the function
  }

  void callCCurrencyCubit(BuildContext context) async {
    final currencyCubit = context.read<CurrenciesCubit>();
    await currencyCubit.getCurrencies();
    emit(ClientSuccessCurrency());

    // Call the function
  }
}
