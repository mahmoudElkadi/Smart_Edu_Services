import 'package:equatable/equatable.dart';

class FreelancerState extends Equatable {
  @override
  List<Object> get props => [];
}

class FreelancerInitial extends FreelancerState {}

class ChangeState extends FreelancerState {}

class FreelancerSuccess extends FreelancerState {}

class ObscureText extends FreelancerState {}

class FreelancerSuccessCountry extends FreelancerState {}

class FreelancerSuccessSpeciality extends FreelancerState {}

class FreelancerSuccessCurrency extends FreelancerState {}

class LoadingSuccess extends FreelancerState {}

class ViewChange extends FreelancerState {}

class GetFreelancerLoading extends FreelancerState {}

class GetFreelancerSuccess extends FreelancerState {}

class FilterFreelancerSuccess extends FreelancerState {}

class FilterFreelancerLoading extends FreelancerState {}

class AddFreelancerSuccess extends FreelancerState {}

class AddFreelancerLoading extends FreelancerState {}

class GetOneFreelancerLoading extends FreelancerState {}

class GetOneFreelancerSuccess extends FreelancerState {}

class DeleteFreelancerLoading extends FreelancerState {}

class DeleteFreelancerSuccess extends FreelancerState {}
