import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watermyplants/Data/plants_list.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeAddPlantButtonNavigateEvent>(homeAddPlantButtonNavigateEvent);
    on<HomeAddPlantEvent>(homeAddPlantEvent);
    on<HomeShopButtonNavigateEvent>(homeShopButtonNavigateEvent);
    on<HomeInfoButtonNavigateEvent>(homeInfoButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    print('Home Initial Event triggered');
    emit(HomeLoadingState());
    Future.delayed(const Duration(seconds: 10));
    print('sending loaded state');
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
  }

  FutureOr<void> homeAddPlantButtonNavigateEvent(
      HomeAddPlantButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to add new plant page
    emit(HomeNavigateToAddPlantState());
  }

  FutureOr<void> homeShopButtonNavigateEvent(
      HomeShopButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to shop
  }

  FutureOr<void> homeInfoButtonNavigateEvent(
      HomeInfoButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to info page
  }

  FutureOr<void> homeAddPlantEvent(
      HomeAddPlantEvent event, Emitter<HomeState> emit) {
    PlantsList.plantsList.add(event.newPlant);
    print('plant added');
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
    print('success state');
  }
}
