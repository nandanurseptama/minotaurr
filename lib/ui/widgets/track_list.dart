import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';

class TrackList extends StatelessWidget {
  final List<MusicModel> tracks;
  final int currentIndex;
  final void Function(int index) onClickTrack;
  const TrackList(
      {super.key,
      required this.tracks,
      this.currentIndex = 0,
      required this.onClickTrack});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 3,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            Container(
              constraints:
                  constraints.copyWith(maxHeight: constraints.maxHeight - 51),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(tracks.length, (index) {
                    return _trackItem(
                        track: tracks[index],
                        isCurrent: currentIndex == index,
                        context: context,
                        index: index);
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _trackItem(
      {required MusicModel track,
      bool isCurrent = false,
      required BuildContext context,
      required int index}) {
    return InkWell(
      onTap: () {
        onClickTrack(index);
        return;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.8, color: Theme.of(context).colorScheme.outline))),
        child: Row(
          children: [
            const SizedBox(
              height: 44,
              child: Icon(Icons.reorder),
            ),
            _smallCover(imageUrl: track.artworkUrl100),
            _titleAndArtistName(
                artistName: track.artistName,
                title: track.trackName,
                isCurrent: isCurrent,
                context: context)
          ],
        ),
      ),
    );
  }

  Widget _smallCover({required String imageUrl}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) {
        return _imageBuilder();
      },
      errorWidget: (context, url, error) {
        return _imageBuilder();
      },
      imageBuilder: (context, imageProvider) {
        return _imageBuilder(placeholderImageProvider: imageProvider);
      },
    );
  }

  Widget _imageBuilder({
    ImageProvider placeholderImageProvider =
        const AssetImage("assets/images/music_cover_placeholder.jpeg"),
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 16),
      height: 44,
      width: 44,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: placeholderImageProvider, fit: BoxFit.cover)),
    );
  }

  Widget _titleAndArtistName(
      {required String artistName,
      required String title,
      bool isCurrent = false,
      required BuildContext context}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      isCurrent ? Theme.of(context).colorScheme.primary : null,
                ),
          ),
          Text(
            artistName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      isCurrent ? Theme.of(context).colorScheme.primary : null,
                ),
          )
        ],
      ),
    );
  }
}
