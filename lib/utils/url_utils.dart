import '../flavor.dart';
import 'constant.dart';

class URLUtils {
  String postLoginUrl() {
    return "${Injector().baseUrl}users/login";
  }

  String getLoginLocationUrl() {
    return "${Injector().baseUrl}ajax?ro=true&ic=0&id=loginlocations";
  }

  String getDockUrl(String warehouseId) {
    return "${Injector().baseUrl}display/dockdisplay?warehouseid=$warehouseId&sublocationid=${Constants.subLocationId}";
    // return "${Injector().baseUrl}display/dockdisplay?code=$warehouseId";
  }

  String getOutwardUrl(String warehouseId) {
    return "${Injector().baseUrl}display/outwarddisplay?code=$warehouseId";
  }

  String getWarehouseUrl(String warehouseId) {
    return "${Injector().baseUrl}display/warehousedisplay?code=$warehouseId";
  }

  String getCustomerListUrl(String warehouseId) {
    return "${Injector().baseUrl}display/customerwiedisplay?code=$warehouseId";
  }

  String getPartListUrl(String customerId) {
    return "${Injector().baseUrl}display/partwisedisplay?code=$customerId";
  }

  String getSpaceListUrl(String customerId) {
    return "${Injector().baseUrl}display/spacewisedisplay?code=$customerId";
  }

  String getFGAreaUrl(String customerId) {
    return "${Injector().baseUrl}display/fifoboard?customerid=$customerId&usageid=8";
  }

  String getBIAreaUrl(String customerId) {
    return "${Injector().baseUrl}display/fifoboard?customerid=$customerId&usageid=7";
  }
}
