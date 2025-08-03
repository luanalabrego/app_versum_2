// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PersistentWebView extends StatefulWidget {
  const PersistentWebView({
    super.key,
    this.width,
    this.height,
    this.initialUrl,
  });

  final double? width;
  final double? height;
  final String? initialUrl;

  @override
  State<PersistentWebView> createState() => _PersistentWebViewState();
}

class _PersistentWebViewState extends State<PersistentWebView> {
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: InAppWebView(
        initialUrlRequest: widget.initialUrl != null
            ? URLRequest(url: WebUri(widget.initialUrl!))
            : null,
        onWebViewCreated: (controller) {
          _controller = controller;
          controller.addJavaScriptHandler(
            handlerName: 'onCastRequest',
            callback: (args) async {
              if (args.isEmpty) return null;
              final arg = args.first as String;
              final url = arg.startsWith('http')
                  ? arg
                  : 'https://player.vimeo.com/video/$arg';

              final connected =
                  GoogleCastSessionManager.instance.connectionState ==
                      GoogleCastConnectState.connected;
              if (!connected) {
                final devices = await GoogleCastDiscoveryManager
                    .instance.devicesStream.first;
                final device = await showDialog<GoogleCastDevice>(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: const Text('Selecionar dispositivo'),
                    children: devices
                        .map(
                          (d) => SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, d),
                            child: Text(d.friendlyName),
                          ),
                        )
                        .toList(),
                  ),
                );
                if (device == null) {
                  return null;
                }
                await GoogleCastSessionManager.instance
                    .startSessionWithDevice(device);
                await GoogleCastSessionManager.instance.currentSessionStream
                    .firstWhere((session) => session != null);
              }

              await castVideo(url: url);
              return null;
            },
          );
        },
      ),
    );
  }
}
