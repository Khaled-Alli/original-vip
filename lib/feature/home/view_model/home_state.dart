
abstract class HomeState  {
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeDoneState extends HomeState {}

class HomeFailedState extends HomeState {
  final String errMsg;
   HomeFailedState(this.errMsg);
}
