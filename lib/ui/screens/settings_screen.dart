import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/features/settings/states/dark_mode_setting_cubit/dark_mode_setting_cubit.dart';

class SettingsScreen extends StatefulWidget {
  final GetIt instance;
  const SettingsScreen({super.key, required this.instance});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final DarkModeSettingCubit _darkModeSettingCubit =
      widget.instance.get<DarkModeSettingCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _darkModeSwitcher(),
            ],
          ),
        );
      },
    );
  }

  Widget _darkModeSwitcher() {
    return BlocBuilder<DarkModeSettingCubit, bool>(
      bloc: _darkModeSettingCubit,
      builder: (context, state) {
        return Row(
          children: [
            const Expanded(child: Text("Dark Mode")),
            Switch(
                value: state,
                onChanged: (value) {
                  _darkModeSettingCubit.setDarkModeSetting(value);
                  return;
                })
          ],
        );
      },
    );
  }
}
