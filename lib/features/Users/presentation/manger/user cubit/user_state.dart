import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class ChangeState extends UserState {}

class UserSuccess extends UserState {}

class ObscureText extends UserState {}

class UserSuccessCountry extends UserState {}

class UserSuccessSpeciality extends UserState {}

class UserSuccessCurrency extends UserState {}

class LoadingSuccess extends UserState {}

class ViewChange extends UserState {}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {}

class FilterUserSuccess extends UserState {}

class FilterUserLoading extends UserState {}

class AddUserSuccess extends UserState {}

class AddUserLoading extends UserState {}

class GetOneUserLoading extends UserState {}

class GetOneUserSuccess extends UserState {}

class DeleteUserLoading extends UserState {}

class DeleteUserSuccess extends UserState {}
