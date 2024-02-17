import 'package:flutter/cupertino.dart';

import '../Beans/ConsumationDayBean.dart';
import '../Utils/ResponseDecoder.dart';
import 'NetworkUtility.dart';
import 'package:http/http.dart' as http;

const HOST =
    "https://131b6ea8-87b5-4141-969d-29d7f4ad6b58.mock.pstmn.io/api/v1/";
const FORM_TYPES = "formTypes/";

class WebService {

  Future<ConsumationDayBean> getConsumationsByDay(
      int day, int month, int year) async {
    String url =
        "http://34.16.19.72:8000/price-consumption/day?bill_id=1&day=1&month=1&year=2023";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
        ResponseDecoder().decodeResponse(response);
    print("test");
    return ConsumationDayBean.getByJson(responseDecoded.body);
  }

  Future<ResponseDecoder> getTip(
      List<dynamic> prices, List<dynamic> consumptions) async {
    String url =
        "http://34.16.19.72:8000/tip";
    http.Response response = await NetworkUtility().post(url, { "consumptions": "[0.085, 0.097, 0.089, 0.102, 0.092, 0.099, 0.144, 0.102, 0.085, 0.094, 0.102, 0.088, 0.093, 0.142, 0.099, 0.09, 0.09, 0.159, 0.103, 0.146, 0.095, 0.091, 0.093, 0.099]", "prices": "[0.085, 0.097, 0.089, 0.102, 0.092, 0.099, 0.144, 0.102, 0.085, 0.094, 0.102, 0.088, 0.093, 0.142, 0.099, 0.09, 0.09, 0.159, 0.103, 0.146, 0.095, 0.091, 0.093, 0.099]" }, false);
   print(consumptions.toString());
    print(prices.toString());

    ResponseDecoder responseDecoded =
    ResponseDecoder().decodeResponse(response);
    print("test");
    return responseDecoded;
  }

  Future<ConsumationDayBean> getConsumationsWeek(
      int day, int month, int year) async {
    String url =
        "http://34.16.19.72:8000/price-consumption/week?bill_id=1&day=1&month=1&year=2023";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
        ResponseDecoder().decodeResponse(response);
    print("test");
    return ConsumationDayBean.getByJson(responseDecoded.body);
  }

  Future<ConsumationDayBean> getConsumationsByMonth(
      int day, int month, int year) async {
    String url =
        "http://34.16.19.72:8000/price-consumption/month?bill_id=1&day=1&month=1&year=2023";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
        ResponseDecoder().decodeResponse(response);
    print("test");
    return ConsumationDayBean.getByJson(responseDecoded.body);
  }

  Future<String> sendIdS(
      String id1, String id2, String id3) async {
    String url =
        "http://34.16.19.72:8000/bill/submit?image_id_1=${id1}&image_id_2=${id2}&image_id_3=${id3}";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
    ResponseDecoder().decodeResponse(response);
    print("test");
    print("response: "+responseDecoded.body.toString());
    return responseDecoded.body.toString();
  }
  Future<String> uploadBill(
      String nameFile) async {
    String url =
        "http://34.16.19.72:8000/bill/upload";
    http.Response response = await NetworkUtility().post(url, {"file": nameFile.toString()}, false);
    ResponseDecoder responseDecoded =
    ResponseDecoder().decodeResponse(response);
    print("test");
    print("response: "+responseDecoded.body.toString());
    return responseDecoded.body;
  }
  Future<Map<String, dynamic>> getExpenses(
      String bill_id) async {
    String url =
        "http://34.16.19.72:8000/bill/${bill_id.toString()}/expenses";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
    ResponseDecoder().decodeResponse(response);
    print("test");
    print("response: "+responseDecoded.body.toString());
    return responseDecoded.body;
  }

  Future<Map<String, dynamic>> getSources(
      String bill_id) async {
    String url =
        "http://34.16.19.72:8000/bill/${bill_id.toString()}/sources";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
    ResponseDecoder().decodeResponse(response);
    print("test");
    print("response: "+responseDecoded.body.toString());
    return responseDecoded.body;
  }
}
