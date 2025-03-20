import 'package:original_vip/feature/home/model/additional_model.dart';

class AdditionalSectionState {
   List<Additional> tempList;
   List<Additional> selectedAdditionals;

   AdditionalSectionState(
      {required this.selectedAdditionals, required this.tempList});

  AdditionalSectionState copyWith({
    List<Additional>? tempList,
    List<Additional>? selectedAdditionals,
  }) {
    return AdditionalSectionState(
        tempList: tempList ?? this.tempList,
        selectedAdditionals: selectedAdditionals ?? this.selectedAdditionals);
  }
}
