import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/cores/theme.dart';
import 'package:minotaur/features/music/states/artists_bloc/artists_bloc.dart';
import 'package:minotaur/features/music/states/search_bloc/search_bloc.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';
import 'package:minotaur/features/settings/states/dark_mode_setting_cubit/dark_mode_setting_cubit.dart';
import 'package:minotaur/inject_dependency.dart';
import 'package:minotaur/ui/screens/navigation_screen.dart';

class BlocObs extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
        "Bloc ${bloc.runtimeType}{currentState : ${change.currentState}, nextState ${change.nextState} }");
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  Bloc.observer = BlocObs();
  runApp(MyApp(
    instance: getIt,
  ));
}

class MyApp extends StatelessWidget {
  late final DarkModeSettingCubit darkModeSettingCubit =
      instance.get<DarkModeSettingCubit>();
  final GetIt instance;
  MyApp({super.key, required this.instance});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArtistsBloc>(create: (_) => instance.get<ArtistsBloc>()),
        BlocProvider<SongsByArtistBloc>(
            create: (_) => instance.get<SongsByArtistBloc>()),
        BlocProvider<SearchBloc>(create: (_) => instance.get<SearchBloc>()),
        BlocProvider<DarkModeSettingCubit>.value(value: darkModeSettingCubit)
      ],
      child: BlocBuilder<DarkModeSettingCubit, bool>(
        builder: (context, isDarkModeActive) {
          return MaterialApp(
            title: 'Minotaur',
            theme: AppTheme.fromIsDarkModeActive(isDarkModeActive).theme,
            home: NavigationScreen(instance: instance),
          );
        },
      ),
    );
  }
}
