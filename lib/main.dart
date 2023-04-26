import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/features/music/states/artists_bloc/artists_bloc.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';
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

void main() {
  initDependency();
  Bloc.observer = BlocObs();
  runApp(MyApp(
    instance: getIt,
  ));
}

class MyApp extends StatelessWidget {
  final GetIt instance;
  const MyApp({super.key, required this.instance});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minotaur',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xfffc3c44),
          brightness: Brightness.dark),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ArtistsBloc>(create: (_) => instance.get<ArtistsBloc>()),
          BlocProvider<SongsByArtistBloc>(
              create: (_) => instance.get<SongsByArtistBloc>())
        ],
        child: NavigationScreen(
          instance: instance,
        ),
      ),
    );
  }
}
