part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeAddPlantButtonNavigateEvent extends HomeEvent {}

class HomeShopButtonNavigateEvent extends HomeEvent {}

class HomeInfoButtonNavigateEvent extends HomeEvent {}

class HomeAddPlantEvent extends HomeEvent {
  final HomePlantModel newPlant;

  HomeAddPlantEvent({required this.newPlant});
}

class HomeDeletePlantEvent extends HomeEvent {
  final HomePlantModel newPlant;

  HomeDeletePlantEvent({required this.newPlant});
}
