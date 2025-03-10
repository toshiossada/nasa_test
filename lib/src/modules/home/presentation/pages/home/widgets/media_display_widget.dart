import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/atoms.dart';
import 'package:design_system/extensions/key_extension.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../domain/enums/media_type_enum.dart';

class MediaDisplayWidget extends StatefulWidget {
  const MediaDisplayWidget({
    required this.mediaType,
    required this.url,
    super.key,
  });
  final MediaTypeEnum mediaType;
  final String url;

  @override
  State<MediaDisplayWidget> createState() => _MediaDisplayWidgetState();
}

class _MediaDisplayWidgetState extends State<MediaDisplayWidget> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.mediaType == MediaTypeEnum.video) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
        ..initialize().then((_) {
          setState(() {
            _isVideoInitialized = true;
          });
        });
    }
  }

  @override
  void dispose() {
    if (widget.mediaType == MediaTypeEnum.video) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: widget.key?.keyValue,
      label: widget.mediaType.label,
      child: SingleChildScrollView(
        // Adicionado SingleChildScrollView
        child: LayoutBuilder(
          builder: (context, constraints) {
            return switch (widget.mediaType) {
              MediaTypeEnum.image => ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 300,
                  maxHeight: constraints.maxHeight,
                ),
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4,
                  child: CachedNetworkImage(
                    imageUrl: widget.url,
                    fit: BoxFit.contain, // Usando BoxFit.contain
                    placeholder:
                        (context, url) => const FCircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const FIcon(icon: Icons.error),
                  ),
                ),
              ),
              MediaTypeEnum.video =>
                _isVideoInitialized
                    ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                    : const FCircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}
