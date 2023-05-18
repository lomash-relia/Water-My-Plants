part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<HomePlantModel> plants;

  HomeLoadedSuccessState({required this.plants});
}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeNavigateToShopState extends HomeActionState {}

class HomeNavigateToInfoState extends HomeActionState {}

class HomeNavigateToAddPlantState extends HomeActionState {}

class HomeAddPlantState extends HomeState {}

class HomeDeletePlantState extends HomeState {}

class HomeRefreshActionState extends HomeActionState {}
