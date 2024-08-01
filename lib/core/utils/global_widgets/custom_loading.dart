part of 'widgets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.staggeredDotsWave(
            size: 8.0.wp,
            color: ColorManager.primaryColor,
          ),
          SizedBox(
            height: 6.0.wp,
          ),
          SizedBox(
            child: Text(
              "getData".tr,
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 4.0.wp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0.wp,
          ),
        ],
      ),
    );
  }
}
