
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';

import 'additional_section_state.dart';

class AdditionalSectionCubit extends Cubit<AdditionalSectionState>{
  AdditionalSectionCubit():super( AdditionalSectionState( selectedAdditionals: [], tempList: []));

 List<Additional> tempList=[];

  void updateAdditionalList(){
    emit(state.copyWith(selectedAdditionals: tempList));
  }

  void addToTempAdditionalList(Additional item){
      tempList = state.tempList;
      tempList.add(item);
    emit(state.copyWith(tempList: tempList));
  }

  void removeFromTempAdditionalList(Additional item){
      tempList = state.tempList;
      tempList.remove(item);
    emit(state.copyWith(tempList: tempList));
  }

}