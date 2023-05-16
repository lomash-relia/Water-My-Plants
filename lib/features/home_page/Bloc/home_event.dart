part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeShopButtonNavigateClickedEvent extends HomeEvent {}

class HomeInfoButtonNavigateClickedEvent extends HomeEvent {}

class FloatingActionButtonClickedEvent extends HomeEvent {}
