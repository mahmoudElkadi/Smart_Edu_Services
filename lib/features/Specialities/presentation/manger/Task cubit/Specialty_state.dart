import 'package:equatable/equatable.dart';

class SpecialityState extends Equatable {
  @override
  List<Object> get props => [];
}

class SpecialityInitial extends SpecialityState {}

class SpecialitySuccess extends SpecialityState {}

class LoadingSuccess extends SpecialityState {}

class ViewChange extends SpecialityState {}

class GetSpecialityLoading extends SpecialityState {}

class GetSpecialitySuccess extends SpecialityState {}

class AddSpecialtySuccess extends SpecialityState {}

class AddSpecialtyLoading extends SpecialityState {}

class GetOneSpecialtyLoading extends SpecialityState {}

class GetOneSpecialtySuccess extends SpecialityState {}

class DeleteSpecialtyLoading extends SpecialityState {}

class DeleteSpecialtySuccess extends SpecialityState {}
