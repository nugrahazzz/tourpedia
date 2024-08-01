part of 'widgets.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(LottieAssets.calendarError,
              width: 45.0.wp, repeat: false),
          Text(
            "Data masih kosong",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 4.0.wp,
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(
          //   height: 20.0.wp,
          // ),
        ],
      ),
    );
  }
}
