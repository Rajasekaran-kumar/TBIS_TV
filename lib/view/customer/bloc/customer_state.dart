part of 'customer_bloc.dart';

@immutable
abstract class CustomerState extends Equatable{
  const CustomerState();

  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

class OnCustListSuccess extends CustomerState {
  final Map<String, dynamic> custList;
  final String timeStamp;
  const OnCustListSuccess({required this.custList, required this.timeStamp});

  @override
  List<Object> get props => [custList,timeStamp];
}

class OnFailure extends CustomerState {
  final String error;
  final String timeStamp;

  const OnFailure({required this.error, required this.timeStamp});

  @override
  List<Object> get props => [error, timeStamp];
}