import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minotaur/cores/theme.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/states/artists_bloc/artists_bloc.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';
import 'package:minotaur/ui/screens/music_player_screen.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_loading.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:minotaur/ui/widgets/track_widget.dart';

class HomeScreen extends StatefulWidget {
  final GetIt instance;
  const HomeScreen({super.key, required this.instance});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ArtistsBloc artistsBloc;
  late SongsByArtistBloc songsByArtistBloc;
  @override
  void initState() {
    super.initState();
    artistsBloc = widget.instance.get<ArtistsBloc>();
    songsByArtistBloc = widget.instance.get<SongsByArtistBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadAllArtist();
    });
  }

  void loadAllArtist() {
    artistsBloc.add(const ArtistsEvent.loadPopularArtist());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistsBloc, ArtistsState>(
      bloc: artistsBloc,
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, artistsState) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                constraints: constraints,
                child: artistsState.maybeMap(error: (value) {
                  return _error(value.error);
                }, loading: (value) {
                  return listArtistSongListWidget(
                      artists: value.artists ?? [], isLoading: true);
                }, loaded: (value) {
                  return listArtistSongListWidget(
                      artists: value.artists, isLoading: false);
                }, orElse: () {
                  return const SizedBox();
                }));
          },
        );
      },
    );
  }

  Widget _error(String error) {
    return Center(
      child: Column(
        children: [
          Text(error),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
            child: const Text("Reload"),
            onPressed: () {
              loadAllArtist();
              return;
            },
          ),
        ],
      ),
    );
  }

  Widget listArtistSongListWidget({
    required List<String> artists,
    bool isLoading = false,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: artists.map((e) {
          return artistSongListWidget(isLoading: isLoading, artistName: e);
        }).toList(),
      ),
    );
  }

  Widget artistSongListWidget({
    String artistName = "",
    bool isLoading = false,
  }) {
    return BlocBuilder<SongsByArtistBloc, Map<String, SongsByArtistState>>(
      bloc: songsByArtistBloc,
      builder: (context, songArtistsState) {
        var songArtistState = songArtistsState[artistName.toLowerCase()] ??
            const SongsByArtistState.loading([]);
        return ShimmerWidget(
          linearGradient: AppTheme.shimmerGradient,
          child: SizedBox(
            height: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ShimmerLoading(
                      isLoading: false,
                      child: isLoading
                          ? Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          : Text(
                              artistName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                    )),
                songArtistState.maybeMap(loaded: (value) {
                  return songsListWidget(
                    isLoading: false,
                    songs: value.songs,
                  );
                }, loading: (value) {
                  return songsListWidget(
                    isLoading: true,
                  );
                }, orElse: () {
                  return const SizedBox();
                })
              ],
            ),
          ),
        );
      },
    );
  }

  Widget songsListWidget({
    bool isLoading = false,
    List<MusicModel> songs = const [],
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(isLoading ? 5 : songs.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: isLoading
                ? TrackWidget.loading(
                    context: context,
                    width: 130,
                    height: 190,
                  )
                : TrackWidget(
                    width: 130,
                    height: 190,
                    onTap: (){
                      onTapTrack(tracks: songs, initialIndex: index);
                      return;
                    },
                    trackCoverUrl: songs[index].artworkUrl100,
                    trackTitle: songs[index].trackName,
                    trackAuthorName: songs[index].artistName),
          );
        }),
      ),
    );
  }
  onTapTrack({
    required List<MusicModel> tracks,
    int initialIndex = 0
  }){
    Navigator.push(context, MaterialPageRoute(builder: (_) => MusicPlayerScreen(tracks: tracks, initialIndex: initialIndex,)));
    return;
  }
}
