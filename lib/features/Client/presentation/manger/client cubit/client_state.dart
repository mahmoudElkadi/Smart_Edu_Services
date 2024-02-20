import 'package:equatable/equatable.dart';

class ClientState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientInitial extends ClientState {}

class ChangeState extends ClientState {}

class ClientSuccess extends ClientState {}

class ObscureText extends ClientState {}

class ClientSuccessCountry extends ClientState {}

class ClientSuccessSpeciality extends ClientState {}

class ClientSuccessCurrency extends ClientState {}

class LoadingSuccess extends ClientState {}

class ViewChange extends ClientState {}

class GetClientLoading extends ClientState {}

class GetClientSuccess extends ClientState {}

class FilterClientSuccess extends ClientState {}

class FilterClientLoading extends ClientState {}

class AddClientSuccess extends ClientState {}

class AddClientLoading extends ClientState {}

class GetOneClientLoading extends ClientState {}

class GetOneClientSuccess extends ClientState {}

class DeleteClientLoading extends ClientState {}

class DeleteClientSuccess extends ClientState {}
