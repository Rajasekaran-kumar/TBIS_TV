import 'package:tbis_tv/utils/url_utils.dart';

import '../tbis_core/model/meta.dart';
import '../tbis_core/network/core.dart';
import '../utils/constant.dart';

class ServiceRepository {
  Future<Meta> postLoginService(
      {required Map<String, dynamic> userData}) async {
    APIServices service = APIServices();
    Meta m = await service.processPostURL(
        URLUtils().postLoginUrl(), userData, "", true);
    return m;
  }

  Future<Meta> getLoginLocationService() async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getLoginLocationUrl(), Constants.authToken);
    return m;
  }

  Future<Meta> getDockService({required String warehouseId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getDockUrl(warehouseId), Constants.authToken);
    return m;
  }

  Future<Meta> getOutwardService({required String warehouseId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getOutwardUrl(warehouseId), Constants.authToken);
    return m;
  }

  Future<Meta> getWarehouseService({required String warehouseId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getWarehouseUrl(warehouseId), Constants.authToken);
    return m;
  }

  Future<Meta> getCustomerListService({required String warehouseId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getCustomerListUrl(warehouseId), Constants.authToken);
    return m;
  }

  Future<Meta> getPartListService({required String customerId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getPartListUrl(customerId), Constants.authToken);
    return m;
  }

  Future<Meta> getSpaceListService({required String customerId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getSpaceListUrl(customerId), Constants.authToken);
    return m;
  }

  Future<Meta> getFGAreaService({required String customerId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getFGAreaUrl(customerId), Constants.authToken);
    return m;
  }

  Future<Meta> getBIAreaService({required String customerId}) async {
    APIServices service = APIServices();
    Meta m = await service.processGetURL(
        URLUtils().getBIAreaUrl(customerId), Constants.authToken);
    return m;
  }
}
