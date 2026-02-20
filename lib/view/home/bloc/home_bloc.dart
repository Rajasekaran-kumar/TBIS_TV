import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/dock_model.dart';
import '../../../model/login_location_model.dart';
import '../../../model/outward_model.dart';
import '../../../model/warehouse_model.dart';
import '../../../repo/service_repo.dart';
import '../../../tbis_core/model/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetLoginLocationEvent>(
        (event, emit) => _getLoginLocationEvent(event, emit));
    on<GetDockEvent>((event, emit) => _getDockEvent(event, emit));
    on<GetOutwardEvent>((event, emit) => _getOutwardEvent(event, emit));
    on<GetWarehouseEvent>((event, emit) => _getWarehouseEvent(event, emit));
  }

  Future<void> _getLoginLocationEvent(
      GetLoginLocationEvent event, Emitter<HomeState> emit) async {
    try {
      Meta m = await ServiceRepository().getLoginLocationService();
      if (m.statusCode == 200) {
        LocationMaster locationResp = LocationMaster.fromJson(m.response);
        emit(OnLoginLocationSuccess(
            locationModel: locationResp.locationModel ?? []));
      } else {
        emit(OnFailure(
            error: m.statusMsg, timeStamp: DateTime.now().toString()));
      }
    } catch (error) {
      emit(OnFailure(
          error: error.toString(), timeStamp: DateTime.now().toString()));
    }
  }

  Future<void> _getDockEvent(
      GetDockEvent event, Emitter<HomeState> emit) async {
    try {
      Meta m = await ServiceRepository()
          .getDockService(warehouseId: event.warehouseId);
      if (m.statusCode == 200) {
        if (m.response["isSuccess"] == true) {
          emit(OnDockSuccess(
              dockResp: DockModel.fromJson(m.response["result"])));
        } else {
          emit(OnFailure(
              error: m.response["message"],
              timeStamp: DateTime.now().toString()));
        }
      } else {
        emit(OnFailure(
            error: m.statusMsg, timeStamp: DateTime.now().toString()));
      }
    } catch (error) {
      emit(OnFailure(
          error: error.toString(), timeStamp: DateTime.now().toString()));
    }
  }

  Future<void> _getOutwardEvent(
      GetOutwardEvent event, Emitter<HomeState> emit) async {
    try {
      Meta m = await ServiceRepository()
          .getOutwardService(warehouseId: event.warehouseId);
      if (m.statusCode == 200) {
        if (m.response['isSuccess'] == true) {
          OutwardModel outwardResp =
              OutwardModel.fromJson(m.response["result"]);
          emit(OnOutwardSuccess(outwardResp: outwardResp));
        } else {
          emit(OnFailure(
              error: m.response["message"],
              timeStamp: DateTime.now().toString()));
        }
      } else {
        emit(OnFailure(
            error: m.statusMsg, timeStamp: DateTime.now().toString()));
      }
    } catch (error) {
      emit(OnFailure(
          error: error.toString(), timeStamp: DateTime.now().toString()));
    }
  }

  Future<void> _getWarehouseEvent(
      GetWarehouseEvent event, Emitter<HomeState> emit) async {
    try {
      Meta m = await ServiceRepository()
          .getWarehouseService(warehouseId: event.warehouseId);
      if (m.statusCode == 200) {
        if (m.response['isSuccess'] == true) {
          if (m.response['result'].isNotEmpty) {
            WarehouseModel warehouseResp =
                WarehouseModel.fromJson(m.response['result'][0]);
            emit(OnWarehouseSuccess(warehouseResp: warehouseResp));
          } else {
            emit(OnFailure(
                error: "Warehouse is Empty",
                timeStamp: DateTime.now().toString()));
          }
        } else {
          emit(OnFailure(
              error: m.response["message"],
              timeStamp: DateTime.now().toString()));
        }
      } else {
        emit(OnFailure(
            error: m.statusMsg, timeStamp: DateTime.now().toString()));
      }
    } catch (error) {
      emit(OnFailure(
          error: error.toString(), timeStamp: DateTime.now().toString()));
    }
  }
}
