import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repo/service_repo.dart';
import '../../../tbis_core/model/meta.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    on<GetCustListEvent>((event, emit) => _getCustListEvent(event, emit));
  }

  Future<void> _getCustListEvent(
      GetCustListEvent event, Emitter<CustomerState> emit) async {
    try {
      Meta m = await ServiceRepository().getLoginLocationService();
      if (m.statusCode == 200) {
        Map<String, dynamic> custResp = m.response;
        emit(OnCustListSuccess(
            custList: custResp, timeStamp: DateTime.now().toString()));
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
