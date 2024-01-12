import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/Network/shared.dart';
import '../../../../Main/presentation/views/main_view.dart';
import '../../../data/model/login_request.dart';
import '../../../data/repos/login_repo.dart';
import '../../view/login_view.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.loginRepo):super(LoginInitial());

  final LoginRepo loginRepo;


  static LoginCubit get(context) => BlocProvider.of(context);


  bool _obscureText=true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState){
    _obscureText=newState;
    emit(ObscureText());
  }

bool isLoading=false;

void loading(){
  isLoading=true;
  emit(LoadingSuccess());
}


  userLogin(LoginReqModel model) {
    emit(LoginUserLoading());


    loginRepo.loginUser(model).then((response) {

      if(response==0){
        Get.off(()=>const MainView());
      }
      else if (response==1){
        isLoading=false;
        Get.snackbar( "User doesn't exist on system!","SignIn Failed",colorText: Colors.white,backgroundColor: Colors.red,icon: const Icon(Icons.add_alert));
      }
      else if (response==2){
        isLoading=false;

        Get.snackbar( "Password is incorrect","SignIn Failed",colorText: Colors.white,backgroundColor: Colors.red,icon: const Icon(Icons.add_alert));
      }
      emit(LoginUserSuccess());
    })
        .catchError((error) {
      isLoading=false;

      Get.snackbar("title", error.toString());
      emit(LoginUserError());

    });
  }

  logOut()async{
    emit(LogOutUserLoading());
    await CacheHelper.removeData(key: "token");
    Get.off(()=>const LoginView());
    emit(LogOutUserSuccess());
  }








}