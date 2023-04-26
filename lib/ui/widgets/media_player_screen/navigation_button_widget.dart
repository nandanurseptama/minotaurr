import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MediaPlayerNavigationButtonWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final VoidCallback? onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;
  final VoidCallback? onClickShuffle;
  final VoidCallback? onClickPlaylist;
  final bool isShuffleActive;
  const MediaPlayerNavigationButtonWidget(
      {super.key,
      required this.audioPlayer,
      this.onPlay,
      this.onNext,
      this.onPrev,
      this.onClickPlaylist,
      this.onClickShuffle,
      this.isShuffleActive = false});

  @override
  State<MediaPlayerNavigationButtonWidget> createState() =>
      _MediaPlayerNavigationButtonWidgetState();
}

class _MediaPlayerNavigationButtonWidgetState
    extends State<MediaPlayerNavigationButtonWidget> {
  late final Stream<PlayerState> _playerState =
      widget.audioPlayer.playerStateStream;

  @override
  Widget build(BuildContext context) {
    return _navigation();
  }

  Widget _navigation() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navigationButton(
              icon: Icons.playlist_play,
              invertColor: true,
              onTap: widget.onClickPlaylist),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _navigationButton(
                    icon: Icons.skip_previous, onTap: widget.onPrev),
                const SizedBox(
                  width: 16,
                ),
                StreamBuilder(
                  stream: _playerState,
                  builder: (context, snapshot) {
                    if (snapshot.data?.processingState ==
                            ProcessingState.buffering ||
                        snapshot.data?.processingState ==
                            ProcessingState.loading) {
                      return _loadingPlayButton();
                    }
                    return _navigationButton(
                        icon: snapshot.data?.playing == true &&
                                snapshot.data?.processingState !=
                                    ProcessingState.completed
                            ? Icons.pause
                            : Icons.play_arrow_sharp,
                        onTap: widget.onPlay);
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                _navigationButton(icon: Icons.skip_next, onTap: widget.onNext),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          _navigationButton(
              icon: Icons.shuffle,
              invertColor: widget.isShuffleActive,
              onTap: widget.onClickShuffle),
        ],
      ),
    );
  }

  Widget _loadingPlayButton() {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary),
      child: const SizedBox(
          height: 20, width: 20, child: CircularProgressIndicator()),
    );
  }

  Widget _navigationButton({
    required IconData icon,
    VoidCallback? onTap,
    bool invertColor = false,
  }) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: onTap == null
              ? Theme.of(context).colorScheme.outline
              : invertColor
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.primary),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          radius: 25,
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Icon(
            icon,
            color: onTap == null
                ? Theme.of(context).colorScheme.onPrimary
                : invertColor
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
