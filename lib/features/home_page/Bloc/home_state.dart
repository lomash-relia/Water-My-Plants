part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeNavigateToShopState extends HomeActionState {}

class HomeNavigateToInfoState extends HomeActionState {}

class HomeNavigateToAddPlantState extends HomeActionState {}
