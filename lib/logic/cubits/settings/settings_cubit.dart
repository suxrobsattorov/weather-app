import 'package:bloc/bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(tempUnit: TempUnits.celsius));

  void toggleTemperature() {
    if (state.tempUnit == TempUnits.celsius) {
      emit(const SettingsState(tempUnit: TempUnits.fahrenheit));
    } else {
      emit(const SettingsState(tempUnit: TempUnits.celsius));
    }
  }
}
