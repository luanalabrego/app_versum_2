// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';

/// Loads the provided [url] on the connected cast device.
Future<void> castVideo({required String url, String? title, String? image}) async {
  final media = GoogleCastMediaInformation(
    contentId: url,
    streamType: CastMediaStreamType.buffered,
    contentType: 'video/mp4',
    contentUrl: Uri.parse(url),
    metadata: GoogleCastGenericMediaMetadata(
      title: title,
      images: image != null ? [GoogleCastImage(url: Uri.parse(image))] : null,
    ),
  );

  await GoogleCastRemoteMediaClient.instance.loadMedia(
    media,
    autoPlay: true,
  );
}
