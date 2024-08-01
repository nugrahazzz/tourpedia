import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/utils/global_widgets/views/modal_bottom_sheet.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            const BottomSheetExample(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
            isScrollControlled: false,
            backgroundColor: ColorManager.bgDark,
            // dragHandleColor: ColorManager.white.withOpacity(0.75),
            // dragHandleSize: Size(10.0.wp, 1.0.wp),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        // splashColor: ColorManager.bgDark.withOpacity(0.35),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
