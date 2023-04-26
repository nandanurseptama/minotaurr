import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:minotaur/ui/widgets/media_player_screen/navigation_button_widget.dart';
import 'package:minotaur/ui/widgets/media_player_screen/progress_widget.dart';

class MusicPlayerScreen extends StatefulWidget {
  final int initialIndex;
  final List<MusicModel> tracks;
  const MusicPlayerScreen(
      {super.key, required this.tracks, this.initialIndex = 0});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late final ValueNotifier<int> _currentMusicIndex;
  final player = AudioPlayer();

  @override
  void initState() {
    _currentMusicIndex = ValueNotifier(widget.initialIndex);
    player.setAudioSource(AudioSource.uri(
        Uri.parse(widget.tracks[widget.initialIndex].previewUrl)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _currentMusicIndex,
        builder: (context, currentMusicIndex, _) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  constraints: constraints,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _mainBody(currentMusic: widget.tracks[currentMusicIndex]),
                      MediaPlayerProgressWidget(
                        audioPlayer:player,
                      ),
                      MediaPlayerNavigationButtonWidget(
                        audioPlayer: player,
                        onPlay: onPlay,
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Widget _mainBody({required MusicModel currentMusic}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
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
    if (player.audioSource == null) {
      await player.setAudioSource(AudioSource.uri(Uri.parse(currentUrl)));
      await player.play();
      return;
    }
    // when source already setted but user want to play different song
    if ((player.audioSource as ProgressiveAudioSource).uri !=
        Uri.parse(currentUrl)) {
      await player.setAudioSource(AudioSource.uri(Uri.parse(currentUrl)));
      await player.play();
      return;
    }
    if ((player.audioSource as ProgressiveAudioSource).uri ==
            Uri.parse(currentUrl) &&
        player.playerState.playing) {
      if (player.playerState.processingState == ProcessingState.completed) {
        await player.seek(Duration.zero);
        return;
      } else {
        await player.pause();
        return;
      }
    }
    if ((player.audioSource as ProgressiveAudioSource).uri ==
            Uri.parse(currentUrl) &&
        !player.playerState.playing) {
      await player.play();
      return;
    }
    return;
  }
}
