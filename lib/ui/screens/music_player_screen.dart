import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:minotaur/ui/widgets/media_player_screen/navigation_button_widget.dart';
import 'package:minotaur/ui/widgets/media_player_screen/progress_widget.dart';
import 'package:minotaur/ui/widgets/track_list.dart';

/// Creates Music Player Screen
///
/// [tracks] are song list
/// [initialIndex] is index of song list that will be played
class MusicPlayerScreen extends StatefulWidget {
  final int initialIndex;
  final List<MusicModel> tracks;
  const MusicPlayerScreen(
      {super.key, required this.tracks, this.initialIndex = 0});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with TickerProviderStateMixin {
  late final ValueNotifier<int> _currentMusicIndex;
  final ValueNotifier<bool> _isShuffleActive = ValueNotifier(false);
  late final StreamSubscription<int?> _currentMusicIndexSubscription;
  late final StreamSubscription<bool?> _shuffleModeSubscription;
  final player = AudioPlayer();

  @override
  void initState() {
    _currentMusicIndex = ValueNotifier(widget.initialIndex);
    player.setAudioSource(
      ConcatenatingAudioSource(
          shuffleOrder: DefaultShuffleOrder(),
          children: List.generate(
              widget.tracks.length,
              (index) =>
                  AudioSource.uri(Uri.parse(widget.tracks[index].previewUrl)))),
      initialIndex: widget.initialIndex,
    );
    player.setShuffleModeEnabled(false);
    _currentMusicIndexSubscription =
        player.currentIndexStream.listen(listenCurrentIndex);
    _shuffleModeSubscription =
        player.shuffleModeEnabledStream.listen(listenShuffleMode);
    super.initState();
  }

  @override
  void dispose() {
    _shuffleModeSubscription.cancel();
    _currentMusicIndexSubscription.cancel();
    _currentMusicIndex.dispose();
    player.stop();
    player.dispose();
    super.dispose();
  }

  void listenShuffleMode(bool? isEnabled) {
    if (isEnabled == null || !mounted) {
      return;
    }
    setState(() {
      _isShuffleActive.value = isEnabled;
    });
    return;
  }

  void listenCurrentIndex(int? index) {
    if (index == null || !mounted) {
      return;
    }
    setState(() {
      _currentMusicIndex.value = index;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isShuffleActive,
        builder: (context, isShuffleModeActive, _) {
          return ValueListenableBuilder<int>(
              valueListenable: _currentMusicIndex,
              builder: (context, currentMusicIndex, _) {
                return Scaffold(
                  body: SafeArea(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        constraints: constraints,
                        padding: const EdgeInsets.only(top: 16, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            _mainBody(
                                currentMusic: widget.tracks[currentMusicIndex]),
                            const SizedBox(
                              height: 40,
                            ),
                            MediaPlayerProgressWidget(
                              audioPlayer: player,
                            ),
                            MediaPlayerNavigationButtonWidget(
                              audioPlayer: player,
                              onPlay: onPlay,
                              onPrev: !player.hasPrevious
                                  ? null
                                  : player.seekToPrevious,
                              onNext:
                                  !player.hasNext ? null : player.seekToNext,
                              onClickPlaylist: () {
                                return onClickPlaylist(
                                    constraints: constraints,
                                    currentIndex: currentMusicIndex);
                              },
                              isShuffleActive: isShuffleModeActive,
                              onClickShuffle: () {
                                player.setShuffleModeEnabled(
                                    !isShuffleModeActive);
                                if (!isShuffleModeActive) {
                                  player.shuffle();
                                }
                              },
                            ),
                            const Expanded(child: SizedBox.expand()),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              });
        });
  }

  Widget _mainBody({required MusicModel currentMusic}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: _buildCover(trackCoverUrl: currentMusic.artworkUrl100),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                currentMusic.trackName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                currentMusic.artistName,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.outline),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCover({required String trackCoverUrl}) {
    Widget build(ImageProvider provider) {
      return Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: provider, fit: BoxFit.cover)),
      );
    }

    return CachedNetworkImage(
      imageUrl: trackCoverUrl,
      imageBuilder: (_, imageProvider) {
        return build(imageProvider);
      },
      errorWidget: (_, url, error) {
        var imageProvider =
            const AssetImage("assets/images/music_cover_placeholder.jpeg");
        return build(imageProvider);
      },
      placeholder: (_, url) {
        var imageProvider =
            const AssetImage("assets/images/music_cover_placeholder.jpeg");
        return build(imageProvider);
      },
    );
  }

  Future<void> onPlay() async {
    var currentUrl = widget.tracks[_currentMusicIndex.value].previewUrl;
    debugPrint(
        "currentUrl $currentUrl, playerState ${player.playerState}, source ${player.audioSource}");
    // when source not setted
    // if (player.audioSource == null) {
    //   await player.setAudioSource(AudioSource.uri(Uri.parse(currentUrl)));
    //   await player.play();
    //   return;
    // }
    // // when source already setted but user want to play different song
    // if ((player.audioSource as ProgressiveAudioSource).uri !=
    //     Uri.parse(currentUrl)) {
    //   await player.setAudioSource(AudioSource.uri(Uri.parse(currentUrl)));
    //   await player.play();
    //   return;
    // }
    if (player.playerState.playing) {
      if (player.playerState.processingState == ProcessingState.completed) {
        await player.seek(Duration.zero);
        return;
      } else {
        await player.pause();
        return;
      }
    }
    if (!player.playerState.playing) {
      await player.play();
      return;
    }
    return;
  }

  void playWithSelectedIndex(int index) {
    player.seek(Duration.zero, index: index);
    return;
  }

  void onClickPlaylist(
      {required BoxConstraints constraints, int currentIndex = 0}) async {
    var bottomSheetConstraints =
        constraints.copyWith(maxHeight: constraints.maxHeight * 0.7);
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      constraints: bottomSheetConstraints,
      enableDrag: true,
      builder: (_) {
        return TrackList(
          tracks: widget.tracks,
          currentIndex: currentIndex,
          onClickTrack: (index) {
            playWithSelectedIndex(index);
            Navigator.pop(context);
            return;
          },
        );
      },
    );
    return;
  }
}
