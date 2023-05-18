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
    on<HomeDeletePlantEvent>(homeDeletePlantEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print('Home Initial Event triggered');
    emit(HomeLoadingState());
    PlantsList.getData();
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
    print('Home Loaded Successfully');
  }

  FutureOr<void> homeAddPlantEvent(
      HomeAddPlantEvent event, Emitter<HomeState> emit) {
    PlantsList.plantsList.add(event.newPlant);
    print('plant added to list');
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
    emit(HomeRefreshActionState());
    print('home success state');
    print(PlantsList.plantsList);
  }

  FutureOr<void> homeDeletePlantEvent(
      HomeDeletePlantEvent event, Emitter<HomeState> emit) {
    PlantsList.plantsList.remove(event.newPlant);
    emit(HomeDeletePlantState());
  }

  FutureOr<void> homeAddPlantButtonNavigateEvent(
      HomeAddPlantButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to add new plant page
    emit(HomeNavigateToAddPlantState());
  }

  FutureOr<void> homeShopButtonNavigateEvent(
      HomeShopButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to shop
    emit(HomeNavigateToShopState());
  }

  FutureOr<void> homeInfoButtonNavigateEvent(
      HomeInfoButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to info page
    emit(HomeNavigateToInfoState());
  }
}
