import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_sheet_dart_state.dart';

class DetailsSheetDartCubit extends Cubit<DetailsSheetDartState> {
  DetailsSheetDartCubit() : super(const DetailsSheetDartMove(false));

  initController(AnimationController controller) {
    detailsSheetController = controller;
  }

  late AnimationController detailsSheetController;
  closeDetailsSheet() async {
    dishController?.stop();
    await detailsSheetController.reverse();
    emit(const DetailsSheetDartMove(false));
  }

  AnimationController? dishController;
  initDishController(AnimationController controller) {
    dishController = controller;
  }
}
