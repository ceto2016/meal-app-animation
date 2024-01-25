part of 'details_sheet_dart_cubit.dart';

sealed class DetailsSheetDartState extends Equatable {
  const DetailsSheetDartState(this.isSheetOpen);
  final bool isSheetOpen;
  @override
  List<Object> get props => [];
}

final class DetailsSheetDartMove extends DetailsSheetDartState {
  const DetailsSheetDartMove(super.isSheetOpen);
}
