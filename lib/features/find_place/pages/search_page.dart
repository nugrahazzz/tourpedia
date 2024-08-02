import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/find_place/controller/find_place_controller.dart';
import 'package:tourpedia/features/find_place/widgets/vertical_card_widget.dart';

class FindPlacePage extends GetView<FindPlaceController> {
  const FindPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    systemBarColor(ColorManager.white, ColorManager.white);
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.5.wp),
        width: 100.0.wp,
        child: Column(
          children: [
            SizedBox(
              height: 12.0.wp,
            ),
            Container(
              height: 15.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0.wp),
                border: Border.all(
                  color: ColorManager.bgDark.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.0.wp),
                    child: Image.asset(
                      "assets/images/search.png",
                      color: ColorManager.bgDark.withOpacity(0.4),
                      height: 8.0.wp,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      onChanged: (String text) {
                        controller.searchKeyword.value = text;
                        controller.searchPlace();
                      },
                      decoration: InputDecoration(
                        hintText: " Find some places here",
                        hintStyle: TextStyles.poppinsRegular.copyWith(
                          color: ColorManager.bgDark.withOpacity(0.4),
                          fontSize: 4.0.wp,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyles.poppinsRegular.copyWith(
                        color: ColorManager.bgDark.withOpacity(0.4),
                        fontSize: 4.0.wp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0.wp),
                    child: VerticalDivider(
                      width: 2,
                      color: ColorManager.bgDark.withOpacity(0.4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 3.5.wp, left: 2.0.wp),
                    child: Image.asset(
                      "assets/images/categorize.png",
                      color: ColorManager.bgDark.withOpacity(0.4),
                      height: 8.0.wp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.0.wp,
            ),
            Obx(
                ()=> Expanded(
                child: (controller.searchKeyword.value == "")
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.listAllPlace.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedWidget(
                            delayDuration: const Duration(milliseconds: 350),
                            child: VerticalCardWidget(
                              location: controller.listAllPlace[index],
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.listSearchPlace.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedWidget(
                            delayDuration: const Duration(milliseconds: 350),
                            child: VerticalCardWidget(
                              location: controller.listSearchPlace[index],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
