import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/states/artists_bloc/artists_bloc.dart';
import 'package:minotaur/features/music/states/search_bloc/search_bloc.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';
import 'package:minotaur/ui/screens/music_player_screen.dart';
import 'package:minotaur/ui/widgets/search_result_widget.dart';
import 'package:minotaur/ui/widgets/songs_artists_list.dart';

class HomeScreen extends StatefulWidget {
  final GetIt instance;
  const HomeScreen({super.key, required this.instance});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ArtistsBloc artistsBloc;
  late SongsByArtistBloc songsByArtistBloc;
  late SearchBloc searchBloc;
  final TextEditingController _searchFieldController = TextEditingController();

  bool showSearchResults = false;
  @override
  void initState() {
    super.initState();
    artistsBloc = widget.instance.get<ArtistsBloc>();
    songsByArtistBloc = widget.instance.get<SongsByArtistBloc>();
    searchBloc = widget.instance.get<SearchBloc>();
  }

  void searchFieldListener() {
    if (_searchFieldController.text.isEmpty) {
      return;
    }
    searchEvent(_searchFieldController.text);
    return;
  }

  void searchEvent(String keyword) {
    searchBloc.add(SearchEvent.search(keyword));
    return;
  }

  @override
  void dispose() {
    _searchFieldController.clear();
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            constraints: constraints,
            child: Column(
              children: [
                _searchField(),
                const SizedBox(
                  height: 16,
                ),
                _clearSearchResult(),
                _bodyBuilder(constraints),
              ],
            ));
      },
    );
  }

  Widget _bodyBuilder(BoxConstraints constraints) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        return state.maybeMap(
          cleared: (value) {
            return _listsArtistSongs(parentConstraints: constraints);
          },
          orElse: () {
            return _searchResultsWidget(parentConstraints: constraints);
          },
        );
      },
    );
  }

  Widget _clearSearchResult() {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: searchBloc,
        builder: (context, searchState) {
          return Visibility(
            visible: searchState.maybeMap(cleared: (value) {
              return false;
            }, orElse: () {
              return true;
            }),
            replacement: const SizedBox(),
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                _searchFieldController.clear();
                searchBloc.add(const SearchEvent.clearSearchResult());
                return;
              },
              child: SizedBox(
                height: 44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Clear Search Result"),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _searchResultsWidget({required BoxConstraints parentConstraints}) {
    return ConstrainedBox(
      constraints: parentConstraints.copyWith(
          maxHeight: parentConstraints.maxHeight - 142,
          maxWidth: parentConstraints.maxWidth - 32),
      child: SearchResultWidget(
        searchBloc: searchBloc,
        onReloadSearch: onReload,
        onTapTrack: ({required initialIndex, required songs}) {
          onTapTrack(tracks: songs, initialIndex: initialIndex);
          return;
        },
      ),
    );
  }

  Widget _searchField() {
    return TextFormField(
      controller: _searchFieldController,
      decoration: InputDecoration(
          labelText: "Search",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Enter Song title or Artist name",
          suffixIcon: InkWell(
            onTap: () {
              searchFieldListener();
              return;
            },
            child: const Icon(Icons.search),
          )),
    );
  }

  Widget _listsArtistSongs({required BoxConstraints parentConstraints}) {
    return ConstrainedBox(
      constraints: parentConstraints.copyWith(
          maxHeight: parentConstraints.maxHeight - 98,
          maxWidth: parentConstraints.maxWidth - 32),
      child: SongsArtistsListWidget(
          songsByArtistBloc: songsByArtistBloc,
          artistsBloc: artistsBloc,
          onTapTrack: onTapTrack),
    );
  }

  onTapTrack({required List<MusicModel> tracks, int initialIndex = 0}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MusicPlayerScreen(
                  tracks: tracks,
                  initialIndex: initialIndex,
                )));
    return;
  }

  onReload() {
    searchFieldListener();
    return;
  }
}
