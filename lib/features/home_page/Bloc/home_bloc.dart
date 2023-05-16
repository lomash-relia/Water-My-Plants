import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeShopButtonNavigateClickedEvent>(homeShopButtonNavigateClickedEvent);
    on<HomeInfoButtonNavigateClickedEvent>(homeInfoButtonNavigateClickedEvent);
    on<FloatingActionButtonClickedEvent>(floatingActionButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeShopButtonNavigateClickedEvent(
      HomeShopButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    //navigate to shop
  }

  FutureOr<void> homeInfoButtonNavigateClickedEvent(
      HomeInfoButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    //navigate to info page
  }

  FutureOr<void> floatingActionButtonClickedEvent(
      FloatingActionButtonClickedEvent event, Emitter<HomeState> emit) {
    //navigate to add new plant page
  }
}
