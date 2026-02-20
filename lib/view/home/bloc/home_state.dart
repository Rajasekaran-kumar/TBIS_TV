part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class OnLoginLocationSuccess extends HomeState {
  final List<LocationModel> locationModel;
  const OnLoginLocationSuccess({required this.locationModel});

  @override
  List<Object> get props => [locationModel];
}

class OnDockSuccess extends HomeState {
  final DockModel dockResp;
  const OnDockSuccess({required this.dockResp});

  @override
  List<Object> get props => [dockResp];
}

class OnOutwardSuccess extends HomeState {
  final OutwardModel outwardResp;
  const OnOutwardSuccess({required this.outwardResp});

  @override
  List<Object> get props => [outwardResp];
}

class OnWarehouseSuccess extends HomeState {
  final WarehouseModel warehouseResp;
  const OnWarehouseSuccess({required this.warehouseResp});

  @override
  List<Object> get props => [warehouseResp];
}

class OnFailure extends HomeState {
  final String error;
  final String timeStamp;

  const OnFailure({required this.error, required this.timeStamp});

  @override
  List<Object> get props => [error, timeStamp];
}
