import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MediaPlayerProgressWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  const MediaPlayerProgressWidget(
      {super.key, this.onChanged, this.onChangeEnd, required this.audioPlayer});

  @override
  State<MediaPlayerProgressWidget> createState() =>
      _MediaPlayerProgressWidgetState();
}

class _MediaPlayerProgressWidgetState extends State<MediaPlayerProgressWidget> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;
  late final StreamSubscription<Duration?> songDurationSubscription;
  late final StreamSubscription<Duration?> songPositionSubscription;
  late final StreamSubscription<Duration?> bufferedPositionSubscription;
  Duration songsDuration = Duration.zero;
  Duration songsPosition = Duration.zero;
  Duration bufferedPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    songDurationSubscription = widget.audioPlayer.durationStream
        .listen(listenSongDurationFromAudioPlayer);
    songPositionSubscription = widget.audioPlayer.positionStream
        .listen(listenSongPositionFromAudioPlayer);
    bufferedPositionSubscription = widget.audioPlayer.bufferedPositionStream
        .listen(listenBufferedSongPosition);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  void listenSongDurationFromAudioPlayer(Duration? duration) {
    if (duration != null) {
      setState(() {
        songsDuration = duration;
      });
    }
    return;
  }

  void listenSongPositionFromAudioPlayer(Duration? duration) {
    if (duration != null) {
      setState(() {
        songsPosition = duration;
      });
    }
    return;
  }

  void listenBufferedSongPosition(Duration? duration) {
    if (duration != null) {
      setState(() {
        bufferedPosition = duration;
      });
    }
    return;
  }

  @override
  void dispose() {
    songDurationSubscription.cancel();
    songPositionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: Theme.of(context).colorScheme.onPrimary,
            inactiveTrackColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: songsDuration.inMilliseconds.toDouble(),
              value: min(bufferedPosition.inMilliseconds.toDouble(),
                  songsDuration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: Colors.transparent,
          ),
          child: Slider(
            min: 0.0,
            max: songsDuration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? songsPosition.inMilliseconds.toDouble(),
                songsDuration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }

  Duration get _remaining => songsDuration - songsPosition;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  required double value,
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => SizedBox(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: const TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

T? ambiguate<T>(T? value) => value;
