import 'package:equatable/equatable.dart';

class CurrenciesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}

class CurrenciesSuccess extends CurrenciesState {}

class LoadingSuccess extends CurrenciesState {}

class ViewChange extends CurrenciesState {}

class GetCurrenciesLoading extends CurrenciesState {}

class GetCurrenciesSuccess extends CurrenciesState {}

class AddCurrenciesSuccess extends CurrenciesState {}

class AddCurrenciesLoading extends CurrenciesState {}

class GetOneCurrenciesLoading extends CurrenciesState {}

class GetOneCurrenciesSuccess extends CurrenciesState {}

class DeleteCurrenciesLoading extends CurrenciesState {}

class DeleteCurrenciesSuccess extends CurrenciesState {}
