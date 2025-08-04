// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';

/// Flag to ensure initialization happens only once.
bool isCastInitialized = false;

/// Initializes the Google Cast context so that cast devices can be
/// discovered and sessions can be started.
Future<void> initializeGoogleCast() async {
  if (isCastInitialized) {
    return;
  }
  // Use the registered Google Cast application ID instead of the default
  // media receiver. This must match the ID configured in the Google Cast
  // Developer Console for this project.
  const appId = '4D64B6E0';
  late final GoogleCastOptions options;
  if (Platform.isIOS) {
    options = IOSGoogleCastOptions(
      GoogleCastDiscoveryCriteriaInitialize.initWithApplicationID(appId),
    );
  } else {
    options = GoogleCastOptionsAndroid(appId: appId);
  }

  await GoogleCastContext.instance.setSharedInstanceWithOptions(options);
  await GoogleCastDiscoveryManager.instance.startDiscovery();
  isCastInitialized = true;
}
