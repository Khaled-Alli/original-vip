
import '../model/laptop_model.dart';

abstract class LaptopState  {
}

class LaptopInitialState extends LaptopState {}

class LaptopLoadingState extends LaptopState {}

class LaptopLoadedState extends LaptopState {
   List<Laptop> laptops;
  LaptopLoadedState(this.laptops);
}

class LaptopErrorState extends LaptopState {
  final String errorMessage;
   LaptopErrorState(this.errorMessage);
}
