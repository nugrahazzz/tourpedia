import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/pages.dart';
import 'package:tourpedia/config/routes/routes.dart';

import 'package:tourpedia/core/services/local_database_service.dart';

import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:vaultify/vaultify.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      //
      color: ColorManager.bgDark,
      theme: LightModeTheme().themeData,
      defaultTransition: Transition.fadeIn,
      //
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('en', 'US'),
      // translations: LocalizationServices(),
      getPages: Pages.getPages,
      initialRoute: Routes.onboardingPage,

      binds: [
        //local storage
        Bind.lazyPut<Vaultify>(fenix: true, Vaultify.new),
        //service
        Bind.lazyPut<LocalDatabaseService>(() => LocalDatabaseService(),
            fenix: true),
      ],
      //
    );
  }
}
