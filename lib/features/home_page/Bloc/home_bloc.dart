import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:watermyplants/Data/plants_list.dart';
import 'package:watermyplants/features/home_page/models/home_plant_model.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
    print('Home Loaded Successfully');
  }

  FutureOr<void> homeAddPlantEvent(
      HomeAddPlantEvent event, Emitter<HomeState> emit) {
    PlantsList.addData(event.newPlant);
    if (event.selectedTime != null) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          category: NotificationCategory.Reminder,
          title: 'Water your plants!',
          body: 'It\'s time to water your plants.',
        ),
        schedule: NotificationCalendar(
            hour: event.selectedTime!.hour,
            minute: event.selectedTime!.minute,
            repeats: true),
      );
    }
    emit(HomeLoadedSuccessState(plants: PlantsList.plantsList));
    emit(HomeRefreshActionState());
    print('home success state');
    print(PlantsList.plantsList);
  }

  FutureOr<void> homeDeletePlantEvent(
      HomeDeletePlantEvent event, Emitter<HomeState> emit) {
    PlantsList.deleteData(event.newPlant);
    emit(HomeDeletePlantState());
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
    emit(HomeNavigateToShopState());
  }

  FutureOr<void> homeInfoButtonNavigateEvent(
      HomeInfoButtonNavigateEvent event, Emitter<HomeState> emit) {
    //navigate to info page
    emit(HomeNavigateToInfoState());
  }
}
