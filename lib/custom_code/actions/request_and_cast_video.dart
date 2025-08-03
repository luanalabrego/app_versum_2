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
  String endpoint = 'http://localhost:8080/current-video',
}) async {
  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode != 200) {
    throw Exception('Failed to load video URL');
  }

  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final url = data['url'] as String?;

  if (url == null) {
    throw Exception('URL not found in response');
  }

  await castVideo(url: url);
}
