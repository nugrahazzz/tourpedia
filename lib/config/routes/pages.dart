import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/features/chat_gemini/pages/chat_gemini_page.dart';
import 'package:tourpedia/features/find_place/binding/find_place_binding.dart';
import 'package:tourpedia/features/home/binding/home_binding.dart';
import 'package:tourpedia/features/home/pages/home_page.dart';
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
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
        FindPlaceBinding()
      ],
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.chatGeminiPage,
      page: () => const ChatGeminiPage(),
      // binding: TimetableBinding()
    ),
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
