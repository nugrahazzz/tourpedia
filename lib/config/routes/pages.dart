import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/features/onboarding/binding/onboarding_binding.dart';
import 'package:tourpedia/features/onboarding/pages/onboarding_page.dart';
import 'package:tourpedia/features/profiling/binding/profiling_binding.dart';
import 'package:tourpedia/features/profiling/pages/profilling_page.dart';

class Pages {
  static final List<GetPage> getPages = [
    GetPage(
      name: Routes.onboardingPage,
      binding: OnboardingBinding(),
      page: () => const OnboardingPage(),
    ),
    GetPage(
        name: Routes.profilingPage,
        page: () => const ProfilingPage(),
        binding: ProfilingBinding()),
  ];

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            "Not Found",
          ),
        ),
      ),
    );
  }
}
