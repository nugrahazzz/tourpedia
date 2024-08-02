import 'package:bounce/bounce.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/get_state_manager/get_state_manager.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/profiling/controller/profiling_controller.dart';

class PickDestinationPage extends GetView<ProfilingController> {
  const PickDestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SizedBox(
          height: 100.0.hp,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 5.0.wp).copyWith(top: 5.5.wp),
            child: ListView(
              children: [
                Text(
                  "Silahkan memilih\ndestinasi favorit Anda.",
                  style: TextStyles.poppinsBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 6.0.wp,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 1.5.wp),

                Text(
                  "(Klik destinasi yang Anda sukai)",
                  style: TextStyles.poppinsRegular.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 4.5.wp,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 10.0.wp),
                //baris 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.toggleSelection(0),
                      child: TopicCircle(
                        title: "Pegunungan",
                        size: 41.0.wp,
                        selected: controller.selectedTopics[0],
                        function: () {
                          controller.toggleSelection(0);
                        },
                      ),
                    ),
                    TopicCircle(
                      title: "Pantai",
                      size: 31.0.wp,
                      selected: controller.selectedTopics[1],
                      function: () {
                        controller.toggleSelection(1);
                      },
                    ),
                    SizedBox(
                      height: 34.0.wp,
                      //samain dengan tinggi dari children row tertinggi
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: OnlyCircle(
                          size: 7.5.wp,
                        ),
                      ),
                    ),
                  ],
                ),

                //baris 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 27.5.wp,
                      alignment: Alignment.bottomCenter,
                      child: TopicCircle(
                        title: "Gua",
                        size: 20.0.wp,
                        selected: controller.selectedTopics[2],
                        function: () {
                          controller.toggleSelection(2);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.0.wp,
                      //samain dengan tinggi dari children row tertinggi
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: OnlyCircle(
                          size: 4.5.wp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 2.0.wp, bottom: 2.0.wp),
                      child: TopicCircle(
                        title: "Danau",
                        size: 22.5.wp,
                        selected: controller.selectedTopics[3],
                        function: () {
                          controller.toggleSelection(3);
                        },
                      ),
                    ),
                    TopicCircle(
                      title: "Museum",
                      size: 30.0.wp,
                      selected: controller.selectedTopics[4],
                      function: () {
                        controller.toggleSelection(4);
                      },
                    ),
                  ],
                ),
                //
                SizedBox(
                  height: 5.0.wp,
                ),
                //baris 3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    TopicCircle(
                      title: "Taman\nNasional",
                      size: 33.0.wp,
                      selected: controller.selectedTopics[5],
                      function: () {
                        controller.toggleSelection(5);
                      },
                    ),
                    const Spacer(),
                    const Spacer(),
                    TopicCircle(
                      title: "Situs Sejarah\ndan Budaya",
                      size: 41.0.wp,
                      selected: controller.selectedTopics[6],
                      function: () {
                        controller.toggleSelection(6);
                      },
                    ),
                    SizedBox(
                      height: 34.0.wp,
                      //samain dengan tinggi dari children row tertinggi
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: OnlyCircle(
                          size: 3.5.wp,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                //baris 4
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: TopicCircle(
                        title: "Air\nTerjun",
                        size: 27.0.wp,
                        selected: controller.selectedTopics[7],
                        function: () {
                          controller.toggleSelection(7);
                        },
                      ),
                    ),
                    const Spacer(),
                    OnlyCircle(
                      size: 7.5.wp,
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopicCircle extends StatelessWidget {
  final String title;
  final bool selected;
  final double size;
  final Function()? function;

  const TopicCircle(
      {super.key,
      required this.title,
      required this.size,
      required this.selected,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: (10 * size).toInt()),
      child: Bounce(
        duration: Duration(milliseconds: (20 * size).toInt()),
        onTap: function,
        scaleFactor: 0.5,
        child: Container(
          width: size, // Adding null check for size
          height: size, // Adding null check for size
          decoration: BoxDecoration(
              color: selected
                  ? Colors.teal
                  : (title != "")
                      ? ColorManager.bgDark.withOpacity(0.08)
                      : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: (title == "")
                      ? ColorManager.bgDark.withOpacity(0.08)
                      : Colors.transparent,
                  width: 0.5.wp)),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.poppinsBold.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 3.3.wp,
                color: selected
                    ? Colors.white
                    : ColorManager.bgDark.withOpacity(0.75),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OnlyCircle extends StatelessWidget {
  final double size;

  const OnlyCircle({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: (10 * size).toInt()),
      child: Bounce(
        duration: Duration(milliseconds: (20 * size).toInt()),
        scaleFactor: 0.5,
        child: Container(
          width: size, // Adding null check for size
          height: size, // Adding null check for size
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: ColorManager.bgDark.withOpacity(0.1), width: 0.5.wp)),
        ),
      ),
    );
  }
}
