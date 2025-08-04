// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Requests the current video URL from a backend service and casts it.
Future<void> requestAndCastVideo({
  // Use an accessible host for emulators or physical devices instead of
  // `localhost`. `10.0.2.2` points to the host machine when running on the
  // Android emulator.
  String endpoint = 'http://10.0.2.2:8080/current-video',
}) async {
  debugPrint('Requesting video from: $endpoint');
  final response = await http.get(Uri.parse(endpoint));
  debugPrint('Response status: ${response.statusCode}');

  if (response.statusCode != 200) {
    throw Exception('Failed to load video URL');
  }

  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final url = data['url'] as String?;
  debugPrint('Received URL: $url');

  if (url == null) {
    throw Exception('URL not found in response');
  }

  await castVideo(url: url);
}
