// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';

/// Button that allows the user to connect to a Google Cast device and
/// start or stop a cast session.
class CastButtonWidget extends StatefulWidget {
  const CastButtonWidget({Key? key}) : super(key: key);

  @override
  State<CastButtonWidget> createState() => _CastButtonWidgetState();
}

class _CastButtonWidgetState extends State<CastButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoogleCastSession?>(
      stream: GoogleCastSessionManager.instance.currentSessionStream,
      builder: (context, snapshot) {
        final connected = GoogleCastSessionManager.instance.connectionState ==
            GoogleCastConnectState.connected;
        return IconButton(
          icon: Icon(
            connected ? Icons.cast_connected : Icons.cast,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          onPressed: () async {
            if (connected) {
              await GoogleCastSessionManager.instance
                  .endSessionAndStopCasting();
            } else {
              final devices = await GoogleCastDiscoveryManager
                  .instance.devicesStream.first;
              final device = await showDialog<GoogleCastDevice>(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Selecionar dispositivo'),
                  children: devices
                      .map((d) => SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, d),
                            child: Text(d.friendlyName ?? d.id),
                          ))
                      .toList(),
                ),
              );
              if (device != null) {
                await GoogleCastSessionManager.instance
                    .startSessionWithDevice(device);
              }
            }
          },
        );
      },
    );
  }
}
