part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class GetCustListEvent extends CustomerEvent {
  const GetCustListEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
