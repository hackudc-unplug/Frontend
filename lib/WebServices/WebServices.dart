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
}
