import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MediaPlayerNavigationButtonWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final VoidCallback? onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;
  const MediaPlayerNavigationButtonWidget(
      {super.key,
      required this.audioPlayer,
      this.onPlay,
      this.onNext,
      this.onPrev});

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
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navigationButton(icon: Icons.skip_previous),
          StreamBuilder(
            stream: _playerState,
            builder: (context, snapshot) {
              return _navigationButton(
                  icon: snapshot.data?.playing == true &&
                          snapshot.data?.processingState !=
                              ProcessingState.completed
                      ? Icons.pause
                      : Icons.play_arrow_sharp,
                  onTap: widget.onPlay);
            },
          ),
          _navigationButton(icon: Icons.skip_next),
        ],
      ),
    );
  }

  Widget _navigationButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          radius: 25,
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
