import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/settings/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: const Text(
          'Temperature unit',
        ),
        subtitle: const Text('Celsius / Fahrenheit (default: Celsius'),
        trailing: Switch.adaptive(
          value:
              context.watch<SettingsCubit>().state.tempUnit == TempUnits.celsius
                  ? true
                  : false,
          onChanged: (value) {
            context.read<SettingsCubit>().toggleTemperature();
          },
        ),
      ),
    );
  }
}
