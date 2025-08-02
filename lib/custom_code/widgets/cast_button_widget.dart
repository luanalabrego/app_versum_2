// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// VERSÃO DE TESTE FINAL - COMENTADA

// import 'package:flutter_chrome_cast/flutter_chrome_cast.dart'; // Comentado

class CastButtonWidget extends StatefulWidget {
  const CastButtonWidget({Key? key}) : super(key: key);

  @override
  _CastButtonWidgetState createState() => _CastButtonWidgetState();
}

class _CastButtonWidgetState extends State<CastButtonWidget> {
  // late ChromeCastController _controller; // Comentado

  @override
  void initState() {
    super.initState();
    // _controller = ChromeCastController.instance; // Comentado
  }

  @override
  Widget build(BuildContext context) {
    // Retornando um container vazio para o teste.
    return Container(
      width: 48.0,
      height: 48.0,
      color: Colors.purple, // Cor roxa para sabermos que é o widget de teste
    );
  }
}
