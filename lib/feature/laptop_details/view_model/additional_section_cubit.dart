
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';

import 'additional_section_state.dart';

class AdditionalSectionCubit extends Cubit<AdditionalSectionState>{
  AdditionalSectionCubit():super( AdditionalSectionState( selectedAdditionals: [], tempList: []));

  List<Additional> tempList=[];

  void updateSelectedAdditionalList(){
    emit(state.copyWith(selectedAdditionals: [...state.tempList],tempList:[...state.tempList] ));
  }

  void cancelSelectedAdditionalList(){
    emit(state.copyWith(tempList: state.selectedAdditionals));
  }

  void addToTempAdditionalList(Additional item){
    emit(state.copyWith(tempList: [...state.tempList,item]));
  }

  void removeFromTempAdditionalList(Additional item){
    tempList = [...state.tempList];
    tempList.remove(item);
     emit(state.copyWith(tempList: tempList));
  }

}