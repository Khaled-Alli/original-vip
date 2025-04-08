
import '../model/additional_model.dart';
import '../model/laptop_model.dart';

abstract class AdditionalState  {
}

class AdditionalInitialState extends AdditionalState {}

class AdditionalLoadingState extends AdditionalState {}

class AdditionalLoadedState extends AdditionalState {
  List<Additional> additionals;
  AdditionalLoadedState(this.additionals);
}

class AdditionalErrorState extends AdditionalState {
  final String errorMessage;
  AdditionalErrorState(this.errorMessage);
}
