import 'package:equatable/equatable.dart';

class StatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class StatusInitial extends StatusState {}

class StatusSuccess extends StatusState {}

class LoadingSuccess extends StatusState {}

class ViewChange extends StatusState {}

class GetStatusLoading extends StatusState {}

class GetStatusSuccess extends StatusState {}

class AddStatusSuccess extends StatusState {}

class AddStatusLoading extends StatusState {}

class GetOneStatusLoading extends StatusState {}

class GetOneStatusSuccess extends StatusState {}

class DeleteStatusLoading extends StatusState {}

class DeleteStatusSuccess extends StatusState {}
