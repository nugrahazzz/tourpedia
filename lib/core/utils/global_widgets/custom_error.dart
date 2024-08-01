part of 'widgets.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;

  const CustomError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.cyan,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.bgDark,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      6.0.wp,
                    ),
                  )),
              margin: EdgeInsets.symmetric(horizontal: 12.0.wp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(6.0.wp),
                    padding: EdgeInsets.only(
                        right: 8.0.wp,
                        left: 8.0.wp,
                        top: 4.0.wp,
                        bottom: 4.0.wp),
                    child: Lottie.asset(LottieAssets.calendarError,
                        fit: BoxFit.cover, filterQuality: FilterQuality.low),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 10.0.wp, right: 7.0.wp, left: 7.0.wp),
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white.withOpacity(0.85),
                          fontSize: 4.2.wp,
                          letterSpacing: 0.8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
