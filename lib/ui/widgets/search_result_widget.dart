import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minotaur/cores/theme.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/states/search_bloc/search_bloc.dart';
import 'package:minotaur/ui/widgets/error_widget.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:minotaur/ui/widgets/track_widget.dart';

class SearchResultWidget extends StatefulWidget {
  final SearchBloc searchBloc;
  final void Function()? onReloadSearch;
  final void Function(
      {required List<MusicModel> songs, required int initialIndex}) onTapTrack;
  const SearchResultWidget(
      {super.key,
      required this.searchBloc,
      this.onReloadSearch,
      required this.onTapTrack});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: widget.searchBloc,
      builder: (context, state) {
        return LayoutBuilder(
          builder: (p0, constraints) {
            return Container(
              constraints: constraints,
              child: state.maybeMap(loading: (value) {
                return _songsGridView(
                    isLoading: true, constraints: constraints);
              }, loaded: (value) {
                return _songsGridView(
                    isLoading: false,
                    songs: value.songs,
                    constraints: constraints);
              }, error: (value) {
                return ErrorWithReloadWidget(
                  errorMessage: value.error,
                  onReload: widget.onReloadSearch,
                );
              }, orElse: () {
                return const SizedBox();
              }),
            );
          },
        );
      },
    );
  }

  Widget _songsGridView(
      {bool isLoading = true,
      List<MusicModel> songs = const [],
      required BoxConstraints constraints}) {
    if (!isLoading && songs.isEmpty) {
      return ErrorWithReloadWidget(
        errorMessage: "Empty search result. Try another keyword",
        onReload: widget.onReloadSearch,
      );
    }
    var crossAxisCount = (constraints.maxWidth - 20) / 135;
    debugPrint("crossAxisCount ${crossAxisCount.round()}");
    return ShimmerWidget(
      linearGradient: AppTheme().shimmerGradient,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            childAspectRatio: 9 / 16,
            crossAxisCount: crossAxisCount.round()),
        scrollDirection: Axis.vertical,
        children: isLoading
            ? List.generate(9, (index) {
                return TrackWidget.loading(
                  context: context,
                  width: 125,
                  height: 190,
                );
              })
            : List.generate(songs.length, (index) {
                return TrackWidget(
                  trackAuthorName: songs[index].artistName,
                  trackCoverUrl: songs[index].artworkUrl100,
                  trackTitle: songs[index].trackName,
                  height: 190,
                  width: 125,
                  onTap: () {
                    widget.onTapTrack(songs: songs, initialIndex: index);
                    return;
                  },
                );
              }),
      ),
    );
  }
}
