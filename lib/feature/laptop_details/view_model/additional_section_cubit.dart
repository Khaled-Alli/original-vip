import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'additional_section_state.dart';

class AdditionalSectionCubit extends Cubit<AdditionalSectionState> {
  AdditionalSectionCubit()
      : super(AdditionalSectionState(selectedAdditionals: [], tempList: [], tempAmounts: {}));

  void updateSelectedAdditionalList() {
    List<Additional> updatedSelection = state.tempList.map((item) {
      int amount = state.tempAmounts[item.id] ?? 1;
      return Additional(item.id, item.name, item.price, amount: amount);
    }).toList();

    emit(state.copyWith(
      selectedAdditionals: updatedSelection,
      tempList: updatedSelection, // Keep tempList in sync
      tempAmounts: {...state.tempAmounts}, // Retain amounts
    ));

  }

  void updateAdditionalAmount(Additional additional, int amount) {
    if (state.tempList.any((item) => item.id == additional.id)) {
      final newAmounts = Map<String, int>.from(state.tempAmounts);
      newAmounts[additional.id] = amount;
      emit(state.copyWith(tempAmounts: newAmounts));
    }
  }

  void cancelSelectedAdditionalList() {
    emit(state.copyWith(
      tempList: [...state.selectedAdditionals],
      tempAmounts: {for (var item in state.selectedAdditionals) item.id: item.amount},
    ));
  }

  void addToTempAdditionalList(Additional item) {
    if (!state.tempList.any((i) => i.id == item.id)) {
      final newTempList = [...state.tempList, item];
      final newAmounts = Map<String, int>.from(state.tempAmounts);
      newAmounts[item.id] = 1; // Default amount = 1
      emit(state.copyWith(tempList: newTempList, tempAmounts: newAmounts));
    }
  }

  void removeFromTempAdditionalList(Additional item) {
    final newTempList = state.tempList.where((i) => i.id != item.id).toList();
    final newAmounts = Map<String, int>.from(state.tempAmounts);
    newAmounts.remove(item.id); // Remove its amount as well
    emit(state.copyWith(tempList: newTempList, tempAmounts: newAmounts));
  }
}
