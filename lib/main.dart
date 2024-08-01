import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:vaultify/vaultify.dart';

import 'core/app/app.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  Gemini.init(
    apiKey: "AIzaSyBSThmR1SVS57udbeDqetEjsuFo25qU68M",
  );

  await Vaultify.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await init();
  runApp(const App());
}
