import 'package:api_integration_bloc/model/home_model.dart';

import 'api-provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<HomeModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
