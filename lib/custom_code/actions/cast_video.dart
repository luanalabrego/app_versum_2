import 'package:flutter_chrome_cast/flutter_chrome_cast.dart';

/// Carrega o [url] no dispositivo Cast conectado.
Future<void> castVideo({
  required String url,
  String? title,
  String? image,
}) async {
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

  try {
    // Apenas await, sem atribuição:
    await GoogleCastRemoteMediaClient.instance.loadMedia(
      media,
      autoPlay: true,
    );

    // Se chegou até aqui sem erro:
    print('✅ Vídeo iniciado com sucesso no dispositivo Cast.');
  } catch (e) {
    // Qualquer erro no canal de plataforma cai aqui
    print('❌ Falha ao iniciar o cast: $e');
    // Opcionalmente mostre um Snackbar ou diálogo ao usuário
  }
}
