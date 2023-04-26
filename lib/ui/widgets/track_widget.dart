import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:minotaur/cores/theme.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_loading.dart';
import 'package:minotaur/ui/widgets/shimmer/shimmer_widget.dart';

/// Track Widget. Used for showing track thumbnail
class TrackWidget extends StatelessWidget {
  final String trackTitle;
  final String trackAuthorName;
  final String trackCoverUrl;
  final double height, width;
  final VoidCallback? onTap;
  const TrackWidget(
      {super.key,
      required this.trackCoverUrl,
      required this.trackTitle,
      required this.trackAuthorName,
      this.onTap,
      this.width = 100,
      this.height = 150});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: trackCoverUrl,
      imageBuilder: (_, imageProvider) {
        return _builder(context: context, imageProvider: imageProvider);
      },
      errorWidget: (_, url, error) {
        var imageProvider =
            const AssetImage("assets/images/music_cover_placeholder.jpeg");
        return _builder(context: context, imageProvider: imageProvider);
      },
      placeholder: (_, url) {
        return loading(context: context, width: width, height: height);
      },
    );
  }

  static Widget loading({
    required BuildContext context,
    double width = 100,
    double height = 150,
  }) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShimmerLoading(
              isLoading: true,
              child: Container(
                height: width,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: ShimmerLoading(
                isLoading: true,
                child: Container(
                  height: 14,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 8.0),
            child: ShimmerLoading(
                isLoading: true,
                child: Container(
                  height: 10,
                  width: width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _builder({
    required BuildContext context,
    required ImageProvider imageProvider,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: width,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: const Border.fromBorderSide(BorderSide.none),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(top: 8.0, bottom: 4),
              child: Text(
                trackTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(top: 0, bottom: 8.0),
              child: Text(
                trackAuthorName,
                style: Theme.of(context).primaryTextTheme.labelSmall?.copyWith(
                    fontSize: 10, color: Theme.of(context).colorScheme.outline),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
