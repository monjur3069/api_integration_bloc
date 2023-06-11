import 'package:api_integration_bloc/bloc/home_event.dart';
import 'package:api_integration_bloc/bloc/home_state.dart';
import 'package:bloc/bloc.dart';

import '../resources/api-repository.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetHomeList>((event, emit) async {
      try {
        emit(HomeLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(HomeLoaded(mList));
        if (mList.err != null) {
          emit(HomeError(mList.err));
        }
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
