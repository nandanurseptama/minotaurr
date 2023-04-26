import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minotaur/cores/theme.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/states/artists_bloc/artists_bloc.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';
import 'package:minotaur/ui/widgets/error_widget.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_loading.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:minotaur/ui/widgets/track_widget.dart';

/// Widget that show list of artists and theirs songs
/// 
/// [artistsBloc], [songsByArtistBloc] and [onTapTrack] are required
class SongsArtistsListWidget extends StatefulWidget {
  final ArtistsBloc artistsBloc;
  final SongsByArtistBloc songsByArtistBloc;
  final void Function(
      {required List<MusicModel> tracks, required int initialIndex}) onTapTrack;
  const SongsArtistsListWidget(
      {super.key,
      required this.songsByArtistBloc,
      required this.artistsBloc,
      required this.onTapTrack});

  @override
  State<SongsArtistsListWidget> createState() => _SongsArtistsListWidgetState();
}

class _SongsArtistsListWidgetState extends State<SongsArtistsListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.artistsBloc.add(const ArtistsEvent.loadPopularArtist());
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, constraints) {
        return Container(
          constraints: constraints,
          child: BlocBuilder<ArtistsBloc, ArtistsState>(
            bloc: widget.artistsBloc,
            builder: (context, state) {
              return state.maybeMap(
                loading: (value) {
                  return _listArtists(artists: [], isLoading: false);
                },
                loaded: (value) {
                  return _listArtists(artists: value.artists, isLoading: false);
                },
                error: (value) {
                  return ErrorWithReloadWidget(
                    errorMessage: value.error,
                    onReload: () {
                      widget.artistsBloc
                          .add(const ArtistsEvent.loadPopularArtist());
                      return;
                    },
                  );
                },
                orElse: () {
                  return const SizedBox();
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _listArtists({
    required List<String> artists,
    bool isLoading = false,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: artists.map((e) {
          return _artistSongList(isLoading: isLoading, artistName: e);
        }).toList(),
      ),
    );
  }

  Widget _artistSongList({
    String artistName = "",
    bool isLoading = false,
  }) {
    return BlocBuilder<SongsByArtistBloc, Map<String, SongsByArtistState>>(
      bloc: widget.songsByArtistBloc,
      builder: (context, songArtistsState) {
        var songArtistState = songArtistsState[artistName.toLowerCase()] ??
            const SongsByArtistState.loading([]);
        return ShimmerWidget(
          linearGradient: AppTheme().shimmerGradient,
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
                    onTap: () {
                      widget.onTapTrack(tracks: songs, initialIndex: index);
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
}
