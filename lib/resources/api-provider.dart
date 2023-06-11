import 'package:api_integration_bloc/model/home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://panel.supplyline.network/api/product-details/-5s5b';

  Future<HomeModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return HomeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return HomeModel.withError("Data not found / Connection issue");
    }
  }
}
