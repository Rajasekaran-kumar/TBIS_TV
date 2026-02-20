part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetLoginLocationEvent extends HomeEvent {
  const GetLoginLocationEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetDockEvent extends HomeEvent {
  final String warehouseId;
  const GetDockEvent({
    required this.warehouseId,
  });
  @override
  // TODO: implement props
  List<Object> get props => [warehouseId];
}

class GetOutwardEvent extends HomeEvent {
  final String warehouseId;
  const GetOutwardEvent({
    required this.warehouseId,
  });
  @override
  // TODO: implement props
  List<Object> get props => [warehouseId];
}

class GetWarehouseEvent extends HomeEvent {
  final String warehouseId;
  const GetWarehouseEvent({
    required this.warehouseId,
  });
  @override
  // TODO: implement props
  List<Object> get props => [warehouseId];
}
