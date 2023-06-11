
import 'package:api_integration_bloc/model/home_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel homeModel;
  const HomeLoaded(this.homeModel);
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}
