import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/features/onboarding/widgets/onboarding_content.dart';
import 'package:video_player/video_player.dart';
import 'package:tourpedia/core/services/local_database_service.dart';

class OnboardingController extends GetxController
    with GetTickerProviderStateMixin {
  // Current page
  RxInt currentPage = 1.obs;

  // Video Player Controller
  Rx<VideoPlayerController?> videoPlayerController =
      Rx<VideoPlayerController?>(null);
  RxBool isLoading = true.obs;

  // Animation Controllers
  late final AnimationController cardsAnimationController;
  late final AnimationController pageIndicatorAnimationController;
  late final AnimationController rippleAnimationController;

  // Animations
  late Animation<double> pageIndicatorAnimation;
  late Animation<double> rippleAnimation;

  // Local Database Service
  final LocalDatabaseService localDbService = LocalDatabaseService();

  @override
  void onInit() {
    super.onInit();

    _initAnimations();
    _initializeVideoPlayer("assets/videos/traveler.mp4");
  }

  @override
  void onClose() {
    cardsAnimationController.dispose();
    pageIndicatorAnimationController.dispose();
    rippleAnimationController.dispose();
    videoPlayerController.value?.dispose();
    super.onClose();
  }

  List<Widget> _getPages() {
    return [
      const OnboardingContent(
        number: 1,
        assetPath: "assets/videos/traveler.mp4",
        title: "Jelajahi Destinasi Eksotis",
        description:
            "Mulailah perjalanan menuju destinasi menakjubkan yang direkomendasikan oleh para wisatawan",
      ),
      const OnboardingContent(
        number: 2,
        assetPath: "assets/videos/meeting.mp4",
        title: 'Bagikan Pengalamanmu',
        description:
            'Mulai ceritakan perjalanan Anda dan jalin persahabatan baru dengan para komunitas di setiap destinasi.',
      ),
      const OnboardingContent(
        number: 3,
        assetPath: "assets/videos/photographer.mp4",
        title: 'Tangkap Setiap Momen',
        description:
            'Abadikan momen-momen indah dari setiap perjalanan Anda, lalu bagikan dengan komunitas.',
      ),
    ];
  }

  Widget getPage() {
    final pages = _getPages();
    if (currentPage.value - 1 < pages.length) {
      return pages[currentPage.value - 1];
    } else {
      throw Exception(
          "Page with number '${currentPage.value}' does not exist.");
    }
  }

  void _initAnimations() {
    cardsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    rippleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    rippleAnimation = Tween<double>(
      begin: 0.0,
      end: Get.width,
    ).animate(CurvedAnimation(
      parent: rippleAnimationController,
      curve: Curves.easeIn,
    ));

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  void _initializeVideoPlayer(String assetPath) {
    isLoading.value = true;
    videoPlayerController.value = VideoPlayerController.asset(assetPath)
      ..initialize().then((_) {
        videoPlayerController.value?.setLooping(true);
        videoPlayerController.value?.play();
        Future.delayed(500.milliseconds, () {
          isLoading.value = false;
        });
      });
  }

  void _setCardsSlideInAnimation() {
    cardsAnimationController.reset();
  }

  void _setCardsSlideOutAnimation() {
    cardsAnimationController.reset();
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    pageIndicatorAnimation = Tween(
      begin: 0.0,
      end: multiplicator * pi,
    ).animate(
      CurvedAnimation(
        parent: pageIndicatorAnimationController,
        curve: Curves.easeIn,
      ),
    );
    pageIndicatorAnimationController.reset();
  }

  void setNextPage(int nextPageNumber) {
    if (nextPageNumber <= _getPages().length) {
      currentPage.value = nextPageNumber;
      switch (nextPageNumber) {
        case 1:
          _initializeVideoPlayer("assets/videos/traveler.mp4");
          break;
        case 2:
          _initializeVideoPlayer("assets/videos/meeting.mp4");
          break;
        case 3:
          _initializeVideoPlayer("assets/videos/photographer.mp4");
          break;
      }
    } else {
      _goToLogin();
    }
  }

  Future<void> nextPage() async {
    if (pageIndicatorAnimation.status == AnimationStatus.dismissed) {
      await _animateNextPage();
      setNextPage(currentPage.value + 1);
    }
  }

  Future<void> _animateNextPage() async {
    pageIndicatorAnimationController.forward();
    await cardsAnimationController.forward();
    _setCardsSlideInAnimation();
    await cardsAnimationController.forward();
    _setCardsSlideOutAnimation();
    _setPageIndicatorAnimation(isClockwiseAnimation: currentPage.value != 2);
  }

  Future<void> _goToLogin() async {
    markOnboardingSeen();

    await rippleAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      Get.offAndToNamed(Routes.profilingPage);
    });
  }

  // Future<bool> _checkOnboardingStatus() async {
  //   _checkOnboardingStatus().then((value) {
  //     _initAnimations();
  //     _initializeVideoPlayer("assets/videos/traveler.mp4");
  //     if (value == true) {
  //       _goToLogin();
  //     } else {}
  //   });
  //
  //   final bool seen = await localDbService.read(Routes.onboardingPage) ?? false;
  //   return seen;
  // }

  void markOnboardingSeen() async {
    await localDbService.write(Routes.onboardingPage, true);
  }
}
