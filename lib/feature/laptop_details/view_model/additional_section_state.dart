import 'package:original_vip/feature/home/model/additional_model.dart';

class AdditionalSectionState {
  final List<Additional> tempList;
  final List<Additional> selectedAdditionals;
  final Map<String, int> tempAmounts;
  // final Map<String, int> selectedAmounts;

  AdditionalSectionState({
    required this.selectedAdditionals,
    required this.tempList,
    required this.tempAmounts,
    // required this.selectedAmounts,
  });

  AdditionalSectionState copyWith({
    List<Additional>? tempList,
    List<Additional>? selectedAdditionals,
    Map<String, int>? tempAmounts,
    // Map<String, int>? selectedAmounts,
  }) {
    return AdditionalSectionState(
      tempList: tempList ?? this.tempList,
      selectedAdditionals: selectedAdditionals ?? this.selectedAdditionals,
      tempAmounts: tempAmounts ?? this.tempAmounts,
      // selectedAmounts: selectedAmounts ?? this.selectedAmounts,
    );
  }
}
