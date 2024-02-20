import 'package:equatable/equatable.dart';

class TransactionState extends Equatable {
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionSuccess extends TransactionState {}

class LoadingSuccess extends TransactionState {}

class ViewChange extends TransactionState {}

class GetTransactionLoading extends TransactionState {}

class GetTransactionSuccess extends TransactionState {}

class AddTransactionSuccess extends TransactionState {}

class AddTransactionLoading extends TransactionState {}

class GetOneTransactionLoading extends TransactionState {}

class GetOneTransactionSuccess extends TransactionState {}

class DeleteTransactionLoading extends TransactionState {}

class DeleteTransactionSuccess extends TransactionState {}
